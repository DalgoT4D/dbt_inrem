
{{ 
  config(
    materialized='table',
  ) 
}}
    SELECT 
      name AS villageentity_id, 
      entity_type AS entity_type, 
      entity_identifier AS name,
      SAFE_CAST(JSON_EXTRACT_SCALAR(entity_loc, '$.features[0].geometry.coordinates[1]') AS FLOAT64) AS latitude,
      SAFE_CAST(JSON_EXTRACT_SCALAR(entity_loc, '$.features[0].geometry.coordinates[0]') AS FLOAT64) AS longitude
FROM {{source('inrem','VillageEntity')}}