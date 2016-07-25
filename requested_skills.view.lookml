
# Reserved for future use

- view: requested_skills
  sql_table_name: |
      `nationalcredit_b`.requested_skills
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: agg_run_id
    type: string
    sql: ${TABLE}.agg_run_id

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month, hour]
    sql: ${TABLE}.end_time

  - dimension: media_type
    type: string
    sql: ${TABLE}.media_type

  - dimension: num_calls_answered
    type: number
    sql: ${TABLE}.num_calls_answered

  - dimension: num_calls_overflow
    type: number
    sql: ${TABLE}.num_calls_overflow

  - dimension: num_calls_queued
    type: number
    sql: ${TABLE}.num_calls_queued

  - dimension: num_calls_received
    type: number
    sql: ${TABLE}.num_calls_received

  - dimension: skill_group_name
    type: string
    sql: ${TABLE}.skill_group_name

  - dimension: skill_name
    type: string
    sql: ${TABLE}.skill_name

  - dimension: skill_type
    type: string
    sql: ${TABLE}.skill_type

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month, hour]
    sql: ${TABLE}.start_time

  - dimension: total_answer_time
    type: number
    sql: ${TABLE}.total_answer_time

  - measure: count
    type: count
    drill_fields: [id, skill_name, skill_group_name]

