
{{ 
  config(
    materialized='table',
  ) 
}}
    SELECT 
      name AS grampanch_id, 
      state AS state, 
      district AS district_id, 
      block AS block_id, 
      grampanch AS name
FROM {{source('inrem','GramPanchayat')}}


