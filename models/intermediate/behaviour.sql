-- these behaviour all have parent_type = 'Village Tracker'
{{ 
  config(
    materialized='table',
  ) 
}}
    SELECT 
      name AS behaviour_id, 
      parent AS villagetracker_id, 
      behav AS behaviour_type,
      creation AS reporting_date,
      behav_follow AS behaviour_follow,
      notes_behav AS notes
FROM {{source('inrem','Behaviour')}} AS behaviour
