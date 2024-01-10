WITH 
crypto_candles AS (
    SELECT * FROM {{ var('crypto_candles') }}
)
SELECT * FROM crypto_candles
