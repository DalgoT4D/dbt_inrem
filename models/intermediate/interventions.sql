-- these interventions all have parent_type = 'Village Tracker'
{{ 
  config(
    materialized='table',
  ) 
}}
    SELECT 
      interventions.name AS intervention_id, 
      interventions.parent AS villagetracker_id, 
      vttve.villageentity_id AS villageentity_id,
      interventions.inter_type AS intervention_type,
      interventions.date_begin AS date_begin,
      interventions.creation AS reporting_date,
      interventions.status_inter AS status,
      interventions.imp_type AS implementor,
      interventions.num_hh AS num_households,
      interventions.freq AS freq,
      interventions.idx AS idx
FROM {{source('inrem','Interventions')}} AS interventions

JOIN {{ ref('village_tracker_to_village_entity') }} AS vttve

ON
  interventions.parent = vttve.villagetracker_id