
# Reserved for future use

- view: overflow_counters
  sql_table_name: |
      `nationalcredit_b`.overflow_counters
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: agg_run_id
    type: string
    sql: ${TABLE}.agg_run_id

  - dimension: destination_phone
    type: string
    sql: ${TABLE}.destination_phone

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month, hour]
    sql: ${TABLE}.end_time

  - dimension: handling_time
    type: number
    sql: ${TABLE}.handling_time

  - dimension: is_overflow
    type: string
    sql: ${TABLE}.is_overflow

  - dimension: media_type
    type: string
    sql: ${TABLE}.media_type

  - dimension: no_team
    type: string
    sql: ${TABLE}.no_team

  - dimension: num_calls_abandoned_after_threshold
    type: number
    sql: ${TABLE}.num_calls_abandoned_after_threshold

  - dimension: num_calls_answered
    type: number
    sql: ${TABLE}.num_calls_answered

  - dimension: num_calls_received
    type: number
    sql: ${TABLE}.num_calls_received

  - dimension: routed_to
    type: string
    sql: ${TABLE}.routed_to

  - dimension: service_name
    type: string
    sql: ${TABLE}.service_name

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month, hour]
    sql: ${TABLE}.start_time

  - measure: count
    type: count
    drill_fields: [id, service_name]

