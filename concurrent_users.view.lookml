
# Reserved for future use

- view: concurrent_users
  sql_table_name: nationalcredit_b.concurrent_users
  fields:

  - dimension: agg_run_id
    type: string
    sql: ${TABLE}.agg_run_id

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month, hour]
    sql: ${TABLE}.end_time

  - dimension: num_users
    type: number
    sql: ${TABLE}.num_users

  - dimension: pkid
    type: number
    value_format_name: id
    sql: ${TABLE}.pkid

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month, hour]
    sql: ${TABLE}.start_time

  - dimension: users
    type: string
    sql: ${TABLE}.users

  - measure: count
    type: count
    drill_fields: []

