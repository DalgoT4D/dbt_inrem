
{{ 
  config(
    materialized='table',
  ) 
}}
    SELECT 
      name AS villageentity_id, 
      entity_type AS entity_type, 
      entity_identifier AS entity_name,
      {{ get_coordinates('entity_loc') }}
FROM {{source('inrem','VillageEntity')}}