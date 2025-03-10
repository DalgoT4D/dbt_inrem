{{ 
  config(
    materialized='table',
  ) 
}}

SELECT
    villagetracker.villagetracker_id,
    villagetracker.datesurvey,
    villagetracker.villageentity_id,

    villageentity_prod.name,
    villageentity_prod.entity_type,
    villageentity_prod.latitude,
    villageentity_prod.longitude,

    villageentity_prod.village_id,
    villageentity_prod.statename,
    villageentity_prod.districtname,
    villageentity_prod.blockname,
    villageentity_prod.grampanchname,
    villageentity_prod.villagename

FROM {{ref('villagetracker')}} AS villagetracker
JOIN 
  {{ref('villageentity_prod')}} AS villageentity_prod
ON villagetracker.villageentity_id = villageentity_prod.villageentity_id
