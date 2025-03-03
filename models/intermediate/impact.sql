
{{ 
  config(
    materialized='table',
  ) 
}}
    SELECT 
      impact.name AS impact_id, 
      vttve.villageentity_id AS villageentity_id,
      impact.parent AS villagetracker_id,
      impact.impact_unit AS impact_unit,
      impact.impact_notes AS impact_notes,
      impact.impact_param AS impact_param,
      impact.impact_metric AS impact_metric,
      impact.impact_indicator AS impact_indicator

FROM {{source('inrem','Impact')}} AS impact
JOIN {{ ref('village_tracker_to_village_entity') }} AS vttve

ON
  impact.parent = vttve.villagetracker_id