{% set row_count = get_row_count('weekly_avg_price') %}

{% if row_count | int < 100 %}
  SELECT 'less than 100' as row_count_status, {{ row_count }} as row_count
{% else %}
  SELECT 'greater than or equal 100' as row_count_status, {{ row_count }} as row_count
{% endif %}