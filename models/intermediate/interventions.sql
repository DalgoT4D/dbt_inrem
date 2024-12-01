-- these interventions all have parent_type = 'Village Tracker'
{{ 
  config(
    materialized='table',
  ) 
}}
    SELECT 
      name AS intervention_id, 
      parent AS villagetracker_id, 
      inter_type AS intervention_type,
      date_begin AS intervention_date,
      status_inter AS status,
      imp_type AS implementor,
      num_hh AS num_households,
      freq AS freq,
      idx AS idx
FROM {{source('inrem','Interventions')}}