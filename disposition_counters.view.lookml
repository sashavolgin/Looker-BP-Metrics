
# Contains disposition counters 

- view: disposition_counters
  sql_table_name: |
      `nationalcredit_b`.disposition_counters
  fields:

  # For data field descriptions see 
  # http://www.brightpattern.com/doc/Documentation/ServicePattern/3.12/reporting-database-specification/disposition_counters
  
  
  # Dimensions
  
  - dimension: disposition
    label: 'Disposition'
    type: string
    sql: ${TABLE}.disposition_name
  
  - dimension: code
    label: 'Code'
    type: string
    sql: ${TABLE}.disposition_code

  - dimension: service_name
    label: 'Service'
    type: string
    sql: ${TABLE}.service_name

  - dimension_group: start_time
    label: 'Start Time'
    type: time
    timeframes: [time, date, week, month, hour]
    sql: ${TABLE}.start_time
  
  - dimension_group: end_time
    label: 'End Time'
    type: time
    timeframes: [time, date, week, month, hour]
    sql: ${TABLE}.end_time

  - dimension: is_campaign
    label: 'Is Campaign'
    type: string
    sql: ${TABLE}.is_campaign

  - dimension: media_type
    label: 'Media Type'
    type: string
    sql: ${TABLE}.media_type


  # Measures for the Disposition in Time Report
  
  - measure: interactions
    label: 'Interactions'
    type: sum
    sql: (${TABLE}.num_campaign_calls + ${TABLE}.num_non_campaign_calls_inbound + ${TABLE}.num_non_campaign_calls_outbound + ${TABLE}.num_preview_items)

  - measure: campaign_records
    label: 'Campaign Records'
    type: sum
    sql: ${TABLE}.num_records_completed

  #- dimension: id
  #  primary_key: true
  #  type: string
  #  sql: ${TABLE}.id

  #- dimension: agg_run_id
  #  type: string
  #  sql: ${TABLE}.agg_run_id

  
  #- dimension: num_calls_outbound
  #  type: number
  #  sql: ${TABLE}.num_calls_outbound

  #- dimension: num_calls_received
  #  type: number
  #  sql: ${TABLE}.num_calls_received

  #- dimension: num_campaign_calls
  #  type: number
  #  sql: ${TABLE}.num_campaign_calls

  #- dimension: num_non_campaign_calls_inbound
  #  type: number
  #  sql: ${TABLE}.num_non_campaign_calls_inbound

  #- dimension: num_non_campaign_calls_outbound
  #  type: number
  #  sql: ${TABLE}.num_non_campaign_calls_outbound

  #- dimension: num_preview_items
  #  type: number
  #  sql: ${TABLE}.num_preview_items

  #- dimension: num_records_completed
  #  type: number
  #  sql: ${TABLE}.num_records_completed

  

  #- measure: count
  #  type: count
  #  drill_fields: [id, service_name, disposition_name]

