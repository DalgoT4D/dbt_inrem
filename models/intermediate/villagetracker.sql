
{{ 
  config(
    materialized='table',
  ) 
}}
    SELECT 
      name AS villagetracker_id, 
      vill_entity AS villageentity_id, 
      date_survey AS datesurvey,
      track_village AS track_village,
      idx AS idx
FROM {{source('inrem','VillageTracker')}}