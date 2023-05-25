import { Knex } from 'knex';
import fs from 'fs';
import createTransaction from '@/connection';

const clearTriggers = async (trx: Knex.Transaction) => {
  console.info('\nClearing triggers...');

  const triggers: string[] = await trx('information_schema.triggers')
    .pluck('TRIGGER_NAME')
    .where({ trigger_schema: 'oarebyue_0.3' });

  const results = await Promise.allSettled(
    triggers.map((t) => trx.raw(`DROP TRIGGER IF EXISTS ${t}`))
  );

  const numSuccessfulTriggers = results.filter(
    (r) => r.status === 'fulfilled'
  ).length;
  const numFailedTriggers = results.filter(
    (r) => r.status === 'rejected'
  ).length;

  console.info(`Cleared ${numSuccessfulTriggers} triggers successfully.`);

  if (numFailedTriggers > 0) {
    console.error(`Failed to clear ${numFailedTriggers} triggers.`);
  }
};

const createTriggers = async (trx: Knex.Transaction) => {
  console.info('\nCreating triggers...');

  const triggerTypes = fs.readdirSync('./sql/triggers');

  let numSuccessfulTriggers = 0;
  let numFailedTriggers = 0;

  await Promise.allSettled(
    triggerTypes.map(async (type) => {
      const triggers = fs.readdirSync(`./sql/triggers/${type}`);

      const results = await Promise.allSettled(
        triggers.map(async (trigger) => {
          const triggerSQL = fs.readFileSync(
            `./sql/triggers/${type}/${trigger}`,
            'utf8'
          );
          await trx.raw(triggerSQL);
        })
      );

      numSuccessfulTriggers += results.filter(
        (r) => r.status === 'fulfilled'
      ).length;
      numFailedTriggers += results.filter(
        (r) => r.status === 'rejected'
      ).length;
    })
  );

  console.info(`Created ${numSuccessfulTriggers} triggers successfully.`);

  if (numFailedTriggers > 0) {
    console.error(`Failed to create ${numFailedTriggers} triggers.`);
  }
};

const clearStoredProcedures = async (trx: Knex.Transaction) => {
  console.info('\nClearing stored procedures...');

  const storedProcedures: string[] = await trx('information_schema.routines')
    .pluck('ROUTINE_NAME')
    .where({ routine_schema: 'oarebyue_0.3', routine_type: 'PROCEDURE' });

  const results = await Promise.allSettled(
    storedProcedures.map((p) => trx.raw(`DROP PROCEDURE IF EXISTS ${p}`))
  );

  const numSuccessfulStoredProcedures = results.filter(
    (r) => r.status === 'fulfilled'
  ).length;
  const numFailedStoredProcedures = results.filter(
    (r) => r.status === 'rejected'
  ).length;

  console.info(
    `Cleared ${numSuccessfulStoredProcedures} stored procedures successfully.`
  );

  if (numFailedStoredProcedures > 0) {
    console.error(
      `Failed to clear ${numFailedStoredProcedures} stored procedures.`
    );
  }
};

const createStoredProcedures = async (trx: Knex.Transaction) => {
  console.info('\nCreating stored procedures...');

  const storedProcedures = fs.readdirSync('./sql/stored_procedures');

  const results = await Promise.allSettled(
    storedProcedures.map(async (p) => {
      const procedureSQL = fs.readFileSync(
        `./sql/stored_procedures/${p}`,
        'utf8'
      );
      await trx.raw(procedureSQL);
    })
  );

  const numSuccessfulStoredProcedures = results.filter(
    (r) => r.status === 'fulfilled'
  ).length;
  const numFailedStoredProcedures = results.filter(
    (r) => r.status === 'rejected'
  ).length;

  console.info(
    `Created ${numSuccessfulStoredProcedures} stored procedures successfully.`
  );

  if (numFailedStoredProcedures > 0) {
    console.error(
      `Failed to create ${numFailedStoredProcedures} stored procedures.`
    );
  }
};

const clearFunctions = async (trx: Knex.Transaction) => {
  console.info('\nClearing functions...');

  const functions: string[] = await trx('information_schema.routines')
    .pluck('ROUTINE_NAME')
    .where({ routine_schema: 'oarebyue_0.3', routine_type: 'FUNCTION' });

  const results = await Promise.allSettled(
    functions.map((f) => trx.raw(`DROP FUNCTION IF EXISTS ${f}`))
  );

  const numSuccessfulFunctions = results.filter(
    (r) => r.status === 'fulfilled'
  ).length;
  const numFailedFunctions = results.filter(
    (r) => r.status === 'rejected'
  ).length;

  console.info(`Cleared ${numSuccessfulFunctions} functions successfully.`);

  if (numFailedFunctions > 0) {
    console.error(`Failed to clear ${numFailedFunctions} functions.`);
  }
};

const createFunctions = async (trx: Knex.Transaction) => {
  console.info('\nCreating functions...');

  const functions = fs.readdirSync('./sql/functions');

  const results = await Promise.allSettled(
    functions.map(async (f) => {
      const functionSQL = fs.readFileSync(`./sql/functions/${f}`, 'utf8');
      await trx.raw(functionSQL);
    })
  );

  const numSuccessfulFunctions = results.filter(
    (r) => r.status === 'fulfilled'
  ).length;
  const numFailedFunctions = results.filter(
    (r) => r.status === 'rejected'
  ).length;

  console.info(`Created ${numSuccessfulFunctions} functions successfully.`);

  if (numFailedFunctions > 0) {
    console.error(`Failed to create ${numFailedFunctions} functions.`);
  }
};

const runAll = async () => {
  try {
    await createTransaction(async (trx) => {
      await clearTriggers(trx);
      await createTriggers(trx);
      await clearStoredProcedures(trx);
      await createStoredProcedures(trx);
      await clearFunctions(trx);
      await createFunctions(trx);
    });
    process.exit();
  } catch (err) {
    console.error(err);
    process.exit(1);
  }
};

runAll();
