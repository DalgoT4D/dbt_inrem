-- these interventions all have parent_type = 'Village Tracker'
{{ 
  config(
    materialized='table',
  ) 
}}

SELECT 
    demography.demography_id,
    demography.villageentity_id,
    demography.num_households,
    demography.key_respondent,
    demography.num_male,
    demography.num_female,
    demography.num_child,
    demography.num_people,
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
FROM {{ref('demography')}} AS demography
    
JOIN
    {{ref('villagetracker_prod')}} as villagetracker_prod
ON demography.villagetracker_id = villagetracker_prod.villagetracker_id
    