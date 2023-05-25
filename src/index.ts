import { Knex } from 'knex';
import fs from 'fs';
import createTransaction from '@/connection';

const clearTriggers = async (trx: Knex.Transaction) => {
  console.info('Clearing triggers...');

  const triggers: string[] = await trx('information_schema.triggers')
    .pluck('TRIGGER_NAME')
    .where({ trigger_schema: 'oarebyue_0.3' });

  await Promise.all(
    triggers.map((t) => trx.raw(`DROP TRIGGER IF EXISTS ${t}`))
  );

  console.info(`Cleared ${triggers.length} triggers.`);
};

const createTriggers = async (trx: Knex.Transaction) => {
  console.info('Creating triggers...');

  const triggerTypes = fs.readdirSync('./sql/triggers');

  let numTriggers = 0;

  await Promise.all(
    triggerTypes.map(async (type) => {
      const triggers = fs.readdirSync(`./sql/triggers/${type}`);

      numTriggers += triggers.length;

      await Promise.all(
        triggers.map(async (trigger) => {
          const triggerSQL = fs.readFileSync(
            `./sql/triggers/${type}/${trigger}`,
            'utf8'
          );
          await trx.raw(triggerSQL);
        })
      );
    })
  );

  console.info(`Created ${numTriggers} triggers.`);
};

const clearStoredProcedures = async (trx: Knex.Transaction) => {
  console.info('Clearing stored procedures...');

  const storedProcedures: string[] = await trx('information_schema.routines')
    .pluck('ROUTINE_NAME')
    .where({ routine_schema: 'oarebyue_0.3', routine_type: 'PROCEDURE' });

  await Promise.all(
    storedProcedures.map((p) => trx.raw(`DROP PROCEDURE IF EXISTS ${p}`))
  );

  console.info(`Cleared ${storedProcedures.length} stored procedures.`);
};

const createStoredProcedures = async (trx: Knex.Transaction) => {
  console.info('Creating stored procedures...');

  const storedProcedures = fs.readdirSync('./sql/stored_procedures');

  await Promise.all(
    storedProcedures.map(async (p) => {
      const procedureSQL = fs.readFileSync(
        `./sql/stored_procedures/${p}`,
        'utf8'
      );
      await trx.raw(procedureSQL);
    })
  );

  console.info(`Created ${storedProcedures.length} stored procedures.`);
};

const clearFunctions = async (trx: Knex.Transaction) => {
  console.info('Clearing functions...');

  const functions: string[] = await trx('information_schema.routines')
    .pluck('ROUTINE_NAME')
    .where({ routine_schema: 'oarebyue_0.3', routine_type: 'FUNCTION' });

  await Promise.all(
    functions.map((f) => trx.raw(`DROP FUNCTION IF EXISTS ${f}`))
  );

  console.info(`Cleared ${functions.length} functions.`);
};

const createFunctions = async (trx: Knex.Transaction) => {
  console.info('Creating functions...');

  const functions = fs.readdirSync('./sql/functions');

  await Promise.all(
    functions.map(async (f) => {
      const functionSQL = fs.readFileSync(`./sql/functions/${f}`, 'utf8');
      await trx.raw(functionSQL);
    })
  );

  console.info(`Created ${functions.length} functions.`);
};

const runAll = async () => {
  await createTransaction(async (trx) => {
    await clearTriggers(trx);
    await createTriggers(trx);
    await clearStoredProcedures(trx);
    await createStoredProcedures(trx);
    await clearFunctions(trx);
    await createFunctions(trx);
  });
  process.exit();
};

runAll();
