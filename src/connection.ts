import knex, { Knex } from 'knex';

/**
 * Gets the appropriate connection URL or object based on the environment.
 * @returns A SQL connection URL or object
 */
const getConnection = (): string | Knex.StaticConnectionConfig | undefined => {
  if (process.env.NODE_ENV === 'production') {
    return process.env.OARE_DB_URL;
  }

  return {
    host: 'localhost',
    user: 'root',
    port: 3306,
    password: 'example',
    database: 'oarebyue_0.3',
  };
};

/**
 * Creates a Knex configuration object based on the environment.
 * @returns A Knex configuration object
 */
const knexConfig = (): Knex.Config => ({
  client: 'mysql',
  connection: getConnection(),
  pool: { min: 0, max: 10 },
});

/**
 * Initialized Knex instance.
 */
const knexInstance = knex(knexConfig());

const createTransaction = async (
  cb: (trx: Knex.Transaction) => Promise<void>
): Promise<void> => {
  await knexInstance.transaction(async (trx) => {
    await cb(trx);
  });
};

export default createTransaction;
