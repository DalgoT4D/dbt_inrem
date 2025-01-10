-- these behaviours all have parent_type = 'Village Tracker'
{{ 
  config(
    materialized='table',
  ) 
}}

SELECT 
    behaviour.behaviour_id,
    behaviour.behaviour_type,
    vttve.villageentity_id,
    behaviour.reporting_date AS reporting_date,
    EXTRACT(YEAR FROM DATE(behaviour.reporting_date)) as reporting_year,
    EXTRACT(MONTH FROM DATE(behaviour.reporting_date)) as reporting_month,
    FORMAT_DATE('%Y-%m', DATE(behaviour.reporting_date)) as reporting_year_month,
    behaviour.behaviour_follow AS behaviour_follow,    
    behaviour.notes AS notes,    
    villagehierarchy.villagename,
    villagehierarchy.statename,
    villagehierarchy.districtname,
    villagehierarchy.blockname,
    villagehierarchy.grampanchname
FROM {{ref('behaviour')}} AS behaviour
    
JOIN
    {{ref('village_tracker_to_village_entity')}} as vttve
ON behaviour.villagetracker_id = vttve.villagetracker_id
    
JOIN
    {{ref('village_to_village_entity')}} AS v2ve
ON vttve.villageentity_id = v2ve.villageentity_id

JOIN
    {{ref('villagehierarchy')}} AS villagehierarchy
ON v2ve.village_id = villagehierarchy.village_id

WHERE reporting_date IS NOT NULL
