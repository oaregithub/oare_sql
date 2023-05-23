import knex from '@/connection';
import fs from 'fs';

const clearTriggers = async () => {
  console.info('Clearing triggers...');

  const triggers: string[] = await knex('information_schema.triggers')
    .pluck('TRIGGER_NAME')
    .where({ trigger_schema: 'oarebyue_0.3' });

  await Promise.all(
    triggers.map((t) => knex.raw(`DROP TRIGGER IF EXISTS ${t}`))
  );

  console.info(`Cleared ${triggers.length} triggers.`);
};

const createTriggers = async () => {
  console.info('Creating triggers...');

  const triggerTypes = fs.readdirSync('./src/triggers');

  let numTriggers = 0;

  await Promise.all(
    triggerTypes.map(async (type) => {
      const triggers = fs.readdirSync(`./src/triggers/${type}`);

      numTriggers += triggers.length;

      await Promise.all(
        triggers.map(async (trigger) => {
          const triggerSQL = fs.readFileSync(
            `./src/triggers/${type}/${trigger}`,
            'utf8'
          );
          await knex.raw(triggerSQL);
        })
      );
    })
  );

  console.info(`Created ${numTriggers} triggers.`);
};

const clearStoredProcedures = async () => {
  console.info('Clearing stored procedures...');

  const storedProcedures: string[] = await knex('information_schema.routines')
    .pluck('ROUTINE_NAME')
    .where({ routine_schema: 'oarebyue_0.3', routine_type: 'PROCEDURE' });

  await Promise.all(
    storedProcedures.map((p) => knex.raw(`DROP PROCEDURE IF EXISTS ${p}`))
  );

  console.info(`Cleared ${storedProcedures.length} stored procedures.`);
};

const createStoredProcedures = async () => {
  console.info('Creating stored procedures...');

  const storedProcedures = fs.readdirSync('./src/stored_procedures');

  await Promise.all(
    storedProcedures.map(async (p) => {
      const procedureSQL = fs.readFileSync(
        `./src/stored_procedures/${p}`,
        'utf8'
      );
      await knex.raw(procedureSQL);
    })
  );

  console.info(`Created ${storedProcedures.length} stored procedures.`);
};

const clearFunctions = async () => {
  console.info('Clearing functions...');

  const functions: string[] = await knex('information_schema.routines')
    .pluck('ROUTINE_NAME')
    .where({ routine_schema: 'oarebyue_0.3', routine_type: 'FUNCTION' });

  await Promise.all(
    functions.map((f) => knex.raw(`DROP FUNCTION IF EXISTS ${f}`))
  );

  console.info(`Cleared ${functions.length} functions.`);
};

const createFunctions = async () => {
  console.info('Creating functions...');

  const functions = fs.readdirSync('./src/functions');

  await Promise.all(
    functions.map(async (f) => {
      const functionSQL = fs.readFileSync(`./src/functions/${f}`, 'utf8');
      await knex.raw(functionSQL);
    })
  );

  console.info(`Created ${functions.length} functions.`);
};

const runAll = async () => {
  await clearTriggers();
  await createTriggers();
  await clearStoredProcedures();
  await createStoredProcedures();
  await clearFunctions();
  await createFunctions();
  process.exit();
};

runAll();
