
{{ 
  config(
    materialized='table',
  ) 
}}
    SELECT 
      name AS villagetracker_id, 
      vill_entity AS villageentity_id
FROM {{source('inrem','VillageTracker')}}
