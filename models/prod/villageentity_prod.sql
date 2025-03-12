{{ 
  config(
    materialized='table',
  ) 
}}

SELECT 
    villageentities.villageentity_id,
    villageentities.entity_name,
    villageentities.entity_type,
    villageentities.latitude,
    villageentities.longitude,

    villagehierarchy.village_id,
    villagehierarchy.statename,
    villagehierarchy.districtname,
    villagehierarchy.blockname,
    villagehierarchy.grampanchname,
    villagehierarchy.villagename

FROM {{ref('villageentities')}} AS villageentities

JOIN
    {{ref('village_to_village_entity')}} AS V2VE
ON villageentities.villageentity_id = V2VE.villageentity_id

JOIN
    {{ref('villagehierarchy')}} AS villagehierarchy
ON V2VE.village_id = villagehierarchy.village_id

