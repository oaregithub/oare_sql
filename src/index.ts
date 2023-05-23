import knex from '@/connection';

const clearTriggers = async () => {
  const triggers: string[] = await knex('information_schema.triggers')
    .pluck('TRIGGER_NAME')
    .where({ trigger_schema: 'oarebyue_0.3' });

  console.log(triggers);

  /* await Promise.all(
    triggers.map((t) => knex.raw(`DROP TRIGGER IF EXISTS ${t}`))
  ); */
};

const createTriggers = async () => {};

const clearStoredProcedures = async () => {};

const createStoredProcedures = async () => {};

const clearFunctions = async () => {};

const createFunctions = async () => {};

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
