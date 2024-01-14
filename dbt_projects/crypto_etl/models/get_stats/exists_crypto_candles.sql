{% set existing = table_exists(var('crypto_candles')) %}

{% if existing %}
  SELECT 'Exists' as table_status, '{{ var('crypto_candles') }}' as table_name
{% else %}
  SELECT 'Does not exist' as table_status, '{{ var('crypto_candles') }}' as table_name
{% endif %}