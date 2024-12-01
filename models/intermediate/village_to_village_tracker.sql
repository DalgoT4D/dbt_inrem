
{{ 
  config(
    materialized='table',
  ) 
}}
    SELECT 
      name AS villagetable_id, 
      village AS village_id, 
      parent AS villagetracker_id
FROM {{source('inrem','VillageTable')}}

WHERE parenttype = 'Village Tracker'