-- these envqualityreporttables all have parent_type = 'Village Tracker'
{{ 
  config(
    materialized='table',
  ) 
}}
    SELECT 
      envqualityreporttables.name AS envqualityreporttable_id, 
      envqualityreporttables.parent AS envqualityreport_id,
      envqualityreporttables.env_para AS environmental_parameter,
      envqualityreporttables.env_conc AS environmental_concentration,
      envqualityreporttables.env_unit AS environmental_unit,
      envqualityreporttables.env_safety AS environmental_safety,
      envqualityreporttables.is_tested AS is_tested,
      envqualityreporttables.approval_status AS approval_status

FROM {{source('inrem','EnvQualityReportTable')}} AS envqualityreporttables

