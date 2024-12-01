
{{ 
  config(
    materialized='table',
  ) 
}}
    SELECT 
      name AS district_id, 
      state AS state, 
      district AS name
FROM {{source('inrem','District')}}