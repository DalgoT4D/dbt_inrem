
{{ 
  config(
    materialized='table',
  ) 
}}
    SELECT 
      name AS demography_id, 
      num_hh AS num_households,
      vttve.villageentity_id AS villageentity_id,
      demography.parent AS villagetracker_id,
      key_resp AS key_respondent,
      num_male AS num_male,
      num_female AS num_female,
      num_child AS num_child,
      num_people AS num_people,

FROM {{source('inrem','Demography')}} AS demography
JOIN {{ ref('village_tracker_to_village_entity') }} AS vttve

ON
  demography.parent = vttve.villagetracker_id