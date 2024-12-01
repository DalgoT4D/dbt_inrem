
{{ 
  config(
    materialized='table',
  ) 
}}
    SELECT 
      name AS district_id, 
      state AS state, 
      District.district AS name
FROM {{source('inrem','District')}}