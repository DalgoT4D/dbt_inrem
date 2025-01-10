{{ 
  config(
    materialized='table',
  ) 
}}
    SELECT
      listofenvqualityreports.villageentity_id AS villageentity_id,
      listofenvqualityreports.villagetracker_id AS villagetracker_id,
      listofenvqualityreports.purpose_of_test AS purpose_of_test,
      listofenvqualityreports.description_of_environmental_source AS description_of_environmental_source,
      envqualityreport.sample_ref AS sample_ref,
      envqualityreport.test_narrative AS test_narrative,
      envqualityreport.reporting_date AS reporting_date,
      envqualityreport.test_method AS test_method,
      envqualityreport.test_vendor AS test_vendor,
      envqualityreport.test_options AS test_options,
      envqualityreporttable.environmental_parameter AS environmental_parameter,
      envqualityreporttable.environmental_concentration AS environmental_concentration,
      envqualityreporttable.environmental_unit AS environmental_unit,
      envqualityreporttable.environmental_safety AS environmental_safety,
      envqualityreporttable.is_tested AS is_tested,
      envqualityreporttable.approval_status AS approval_status
    FROM {{ ref('listofenvqualityreports') }} AS listofenvqualityreports

    JOIN {{ ref('envqualityreport') }} AS envqualityreport
    ON listofenvqualityreports.envqualityreport_id = envqualityreport.envqualityreport_id
    
    JOIN {{ ref('envqualityreporttable') }} AS envqualityreporttable
    ON envqualityreport.envqualityreport_id = envqualityreporttable.envqualityreport_id
    
    WHERE listofenvqualityreports.villageentity_id IS NOT NULL