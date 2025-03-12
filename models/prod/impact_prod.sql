-- these impacts all have parent_type = 'Village Tracker'
{{ 
  config(
    materialized='table',
  ) 
}}

SELECT 
    impact.impact_id,
    impact.villageentity_id,
    impact.impact_unit AS impact_unit,
    impact.impact_notes AS impact_notes,
    CASE
      WHEN impact.impact_param = '' THEN 'Health'
      ELSE impact.impact_param
    END AS impact_param,
    impact.impact_metric AS impact_metric,
    impact.impact_indicator AS impact_indicator,
    
    villagetracker_prod.entity_type,
    villagetracker_prod.entity_name,
    villagetracker_prod.latitude,
    villagetracker_prod.longitude,
    villagetracker_prod.datesurvey,
    EXTRACT(YEAR FROM DATE(villagetracker_prod.datesurvey)) as survey_year,
    EXTRACT(MONTH FROM DATE(villagetracker_prod.datesurvey)) as survey_month,
    FORMAT_DATE('%Y-%m', DATE(villagetracker_prod.datesurvey)) as survey_year_month,

    villagetracker_prod.villagename,
    villagetracker_prod.statename,
    villagetracker_prod.districtname,
    villagetracker_prod.blockname,
    villagetracker_prod.grampanchname
FROM {{ref('impact')}} AS impact
    
JOIN
    {{ref('villagetracker_prod')}} as villagetracker_prod
ON impact.villagetracker_id = villagetracker_prod.villagetracker_id
