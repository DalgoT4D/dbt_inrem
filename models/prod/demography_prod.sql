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
    villagehierarchy.villagename,
    villagehierarchy.statename,
    villagehierarchy.districtname,
    villagehierarchy.blockname,
    villagehierarchy.grampanchname
FROM {{ref('demography')}} AS demography
    
JOIN
    {{ref('village_to_village_tracker')}} as V2VT
ON demography.villagetracker_id = V2VT.villagetracker_id
    
JOIN
    {{ref('villagehierarchy')}} AS villagehierarchy
ON V2VT.village_id = villagehierarchy.village_id

