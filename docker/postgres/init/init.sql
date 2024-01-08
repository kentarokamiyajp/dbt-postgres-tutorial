CREATE DATABASE crypto_db;

\c crypto_db;

CREATE TABLE crypto_candles (
    id TEXT,
    low double precision,
    high double precision,
    open double precision,
    close double precision,
    volume double precision,
    dt date
);

COPY crypto_candles
FROM '/docker-entrypoint-initdb.d/crypto_daily_candles.csv'
DELIMITER ','
CSV HEADER;
