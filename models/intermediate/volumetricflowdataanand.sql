{{ 
  config(
    materialized='table',
  ) 
}}

select 
  t.Village_name, 
  CAST(t.Volumetric_Flow as NUMERIC) as volumetric_flow_num,
  Case 
    when t.RO__1_or_Chlorination__2 = '1' then 'RO'
    when t.RO__1_or_Chlorination__2 = '2' then 'Chlorination'
    else null
  end as Source,
  SAFE.PARSE_TIMESTAMP('%Y/%m/%d %H:%M:%S', t.timestamp) AS converted_timestamp,
  EXTRACT(YEAR FROM DATE(SAFE.PARSE_TIMESTAMP('%Y/%m/%d %H:%M:%S', t.timestamp))) AS reporting_year,
  EXTRACT(MONTH FROM DATE(SAFE.PARSE_TIMESTAMP('%Y/%m/%d %H:%M:%S', t.timestamp))) AS reporting_month,
  FORMAT_DATE('%Y-%m', DATE(SAFE.PARSE_TIMESTAMP('%Y/%m/%d %H:%M:%S', t.timestamp))) AS reporting_year_month,
  case
    when t.timestamp = latest.latest_timestamp then 'Latest'
    else null
  end as is_latest

FROM {{source('inrem','Volumetric_Flow_Data_Anand')}} as t
JOIN
    (SELECT 
      Village_name,
      RO__1_or_Chlorination__2,
      max(Timestamp) as latest_timestamp 
    FROM {{source('inrem','Volumetric_Flow_Data_Anand')}}
    group by Village_name,RO__1_or_Chlorination__2 
    order by RO__1_or_Chlorination__2,Village_name) latest
  on t.Village_name = latest.Village_name and t.RO__1_or_Chlorination__2 = latest.RO__1_or_Chlorination__2
where SAFE.PARSE_TIMESTAMP('%Y/%m/%d %H:%M:%S', t.timestamp) is not null