-- these interventions all have parent_type = 'Village Tracker'
{{ 
  config(
    materialized='table',
  ) 
}}

select 
  village.village_id AS village_id,
  village.name AS villagename,
  grampanchayats.name AS grampanchname,
  blocks.name AS blockname,
  districts.name AS districtname,
  village.state AS statename
from 
  {{ref('village')}} AS village

join {{ref('blocks')}} AS blocks
  on `blocks`.`block_id` = `village`.`block_id`

join {{ref('districts')}} AS districts
  on `districts`.`district_id` = `village`.`district_id`

join {{ref('grampanchayats')}} AS grampanchayats
  on `grampanchayats`.`grampanch_id` = `village`.`grampanch_id`

