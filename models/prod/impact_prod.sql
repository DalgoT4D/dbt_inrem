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
    villagetracker.datesurvey,
    EXTRACT(YEAR FROM DATE(villagetracker.datesurvey)) as survey_year,
    EXTRACT(MONTH FROM DATE(villagetracker.datesurvey)) as survey_month,
    FORMAT_DATE('%Y-%m', DATE(villagetracker.datesurvey)) as survey_year_month,
    villagehierarchy.villagename,
    villagehierarchy.statename,
    villagehierarchy.districtname,
    villagehierarchy.blockname,
    villagehierarchy.grampanchname
FROM {{ref('impact')}} AS impact
    
JOIN
    {{ref('village_to_village_tracker')}} as V2VT
ON impact.villagetracker_id = V2VT.villagetracker_id
    
JOIN
    {{ref('villagehierarchy')}} AS villagehierarchy
ON V2VT.village_id = villagehierarchy.village_id

JOIN
    {{ref('villagetracker')}} AS villagetracker
ON impact.villagetracker_id = villagetracker.villagetracker_id
