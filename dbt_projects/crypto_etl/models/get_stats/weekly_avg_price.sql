{{ config(materialized='table') }}

WITH 
crypto_candles_with_week_number AS (
    SELECT
        *,
        EXTRACT('week' FROM dt) AS week_num
    FROM
        public.crypto_candles
),
avg_price AS (
    SELECT
        id,
        week_num,
        avg(close) AS avg_close,
        avg(volume) AS avg_volume
    FROM
        crypto_candles_with_week_number
    GROUP BY
        id,
        week_num
)
SELECT * FROM avg_price
