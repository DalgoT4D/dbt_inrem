-- these envqualityreports all have parent_type = 'Village Tracker'
{{ 
  config(
    materialized='table',
  ) 
}}
    SELECT 
      envqualityreports.name AS envqualityreport_id, 
      envqualityreports.purp_test AS purpose_of_test,
      envqualityreports.approve_by AS approve_by,
      envqualityreports.sample_ref AS sample_ref,
      envqualityreports.test_narra AS test_narrative,
      envqualityreports.report_date AS report_date,
      envqualityreports.test_method AS test_method,
      envqualityreports.test_vendor AS test_vendor,
      envqualityreports.test_options AS test_options,
      envqualityreports.workflow_state AS workflow_state

FROM {{source('inrem','EnvQualityReport')}} AS envqualityreports

