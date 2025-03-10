-- these behaviours all have parent_type = 'Village Tracker'
{{ 
  config(
    materialized='table',
  ) 
}}

SELECT 
    behaviour.behaviour_id,
    behaviour.behaviour_type,
    villagetracker_prod.villageentity_id,
    behaviour.reporting_date AS reporting_date,
    EXTRACT(YEAR FROM DATE(behaviour.reporting_date)) as reporting_year,
    EXTRACT(MONTH FROM DATE(behaviour.reporting_date)) as reporting_month,
    FORMAT_DATE('%Y-%m', DATE(behaviour.reporting_date)) as reporting_year_month,
    behaviour.behaviour_follow AS behaviour_follow,    
    behaviour.notes AS notes,    
    villagetracker_prod.villagename,
    villagetracker_prod.statename,
    villagetracker_prod.districtname,
    villagetracker_prod.blockname,
    villagetracker_prod.grampanchname
FROM {{ref('behaviour')}} AS behaviour
    
JOIN
    {{ref('villagetracker_prod')}} as villagetracker_prod
ON behaviour.villagetracker_id = villagetracker_prod.villagetracker_id

WHERE reporting_date IS NOT NULL
