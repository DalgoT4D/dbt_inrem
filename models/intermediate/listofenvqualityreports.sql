-- these listofenvqualityreports all have parent_type = 'Village Tracker'
{{ 
  config(
    materialized='table',
  ) 
}}
    SELECT 
      listofenvqualityreports.name AS listofenvqualityreports_id, 
      listofenvqualityreports.parent AS villagetracker_id, 
      vttve.villageentity_id AS villageentity_id,
      listofenvqualityreports.purp_test AS purpose_of_test,
      listofenvqualityreports.test_report AS envqualityreport_id,
      listofenvqualityreports.descr_env_source AS description_of_environmental_source

FROM {{source('inrem','ListofEnvQualityReports')}} AS listofenvqualityreports

JOIN {{ ref('village_tracker_to_village_entity') }} AS vttve

ON
  listofenvqualityreports.parent = vttve.villagetracker_id