
{{ 
  config(
    materialized='table',
  ) 
}}
    SELECT 
      name AS villagetracker_id, 
      vill_entity AS villageentity_id, 
      date_survey AS datesurvey,
      idx AS idx
FROM {{source('inrem','VillageTracker')}}