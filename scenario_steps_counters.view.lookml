
# Reserved for future use

- view: scenario_steps_counters
  sql_table_name: |
      `nationalcredit_b`.scenario_steps_counters
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: agg_run_id
    type: string
    sql: ${TABLE}.agg_run_id

  - dimension: block_title
    type: string
    sql: ${TABLE}.block_title

  - dimension: block_type
    type: string
    sql: ${TABLE}.block_type

  - dimension: caller_disconnect
    type: string
    sql: ${TABLE}.caller_disconnect

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month, hour]
    sql: ${TABLE}.end_time

  - dimension: exit_id
    type: string
    sql: ${TABLE}.exit_id

  - dimension: num_steps
    type: number
    sql: ${TABLE}.num_steps

  - dimension: scenario_name
    type: string
    sql: ${TABLE}.scenario_name

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month, hour]
    sql: ${TABLE}.start_time

  - measure: count
    type: count
    drill_fields: [id, scenario_name]

