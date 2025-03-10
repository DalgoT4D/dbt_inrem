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
    villagetracker_prod.villagename,
    villagetracker_prod.statename,
    villagetracker_prod.districtname,
    villagetracker_prod.blockname,
    villagetracker_prod.grampanchname
FROM {{ref('demography')}} AS demography
    
JOIN
    {{ref('villagetracker_prod')}} as villagetracker_prod
ON demography.villagetracker_id = villagetracker_prod.villagetracker_id
    