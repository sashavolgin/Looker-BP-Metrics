
# Contains aggregated data for virtual queues 

- view: callback_counters
  sql_table_name: nationalcredit_b.callback_counters
  fields:

  # For data field descriptions see 
  # http://www.brightpattern.com/doc/Documentation/ServicePattern/3.12/reporting-database-specification/callback_counters
  
  # Dimensions
  
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
  
  
  # Measures
  
  - measure: calls_queued
    label: 'Calls Queued'
    type: sum
    sql: ${TABLE}.num_calls_queued
    
  - measure: callbacks_requested
    label: 'Callbacks Requested'
    type: sum
    sql: ${TABLE}.num_callbacks_requested
    
  - measure: callbacks_requested_percent
    label: 'Callbacks Requested %'
    type: number
    sql: 100.00 * ${callbacks_requested} / ${calls_queued}
    value_format: '0.0'    
  
  - measure: callbacks_attempted
    label: 'Callbacks Attempted'
    type: sum
    sql: ${TABLE}.num_callbacks_attempted

  - measure: callbacks_busy
    label: 'Callbacks Busy'
    type: sum
    sql: ${TABLE}.num_callbacks_busy
    
  - measure: callbacks_busy_percent
    label: 'Callbacks Busy %'
    type: number
    sql: 100.00 * ${callbacks_busy} / ${callbacks_requested}
    value_format: '0.0'    
  
  - measure: callbacks_no_answer
    label: 'Callbacks No Answer'
    type: sum
    sql: ${TABLE}.num_callbacks_no_answer
    
  - measure: callbacks_no_answer_percent
    label: 'Callbacks No Answer %'
    type: number
    sql: 100.00 * ${callbacks_no_answer} / ${callbacks_requested}
    value_format: '0.0'    
  
  - measure: callbacks_answered
    label: 'Callbacks Answered'
    type: sum
    sql: ${TABLE}.num_callbacks_answered
    
  - measure: callbacks_answered_percent
    label: 'Callbacks Answered %'
    type: number
    sql: 100.00 * ${callbacks_answered} / ${callbacks_requested}
    value_format: '0.0'    
  
  - measure: callbacks_abandoned
    label: 'Callbacks Abandoned'
    type: sum
    sql: ${TABLE}.num_callbacks_abandoned
    
  - measure: callbacks_abandoned_percent
    label: 'Callbacks Abandoned %'
    type: number
    sql: 100.00 * ${callbacks_abandoned} / ${callbacks_requested}
    value_format: '0.0'
    
  - measure: callbacks_handled
    label: 'Callbacks Handled'
    type: sum
    sql: ${TABLE}.num_callbacks_handled  
  
  - measure: total_wait_time_to_callback
    label: 'Total Wait Time to Callback'
    type: sum
    sql: ${TABLE}.callback_wait_time
    
  - measure: average_wait_time_to_callback
    label: 'Avg Wait Time to Callback (seconds)'
    type: number
    sql: ${total_wait_time_to_callback} / ${callbacks_attempted}
    
  - measure: average_wait_time_to_callback_formatted
    label: 'Avg Wait Time to Callback'
    type: number
    sql: cast(${average_wait_time_to_callback} as decimal(10,6))/86400
    value_format: '[h]:mm:ss'  
    
  - measure: total_callback_dialing_time
    label: 'Total Callback Dialing Time'
    type: sum
    sql: ${TABLE}.callback_customer_answer_time 
    
  - measure: average_callback_dialing_time
    label: 'Avg Callback Dialing Time'
    type: number
    sql: ${total_callback_dialing_time} / ${callbacks_answered}
      
  - measure: total_agent_answer_time
    label: 'Total Agent Answer Time'
    type: sum
    sql: ${TABLE}.callback_agent_answer_time
    
  - measure: average_agent_answer_time
    label: 'Avg Agent Answer Time'
    type: number
    sql: ${total_agent_answer_time} / ${callbacks_handled}  
  
  
  
  #- dimension: id
  #  primary_key: true
  #  type: string
  #  sql: ${TABLE}.id

  #- dimension: agg_run_id
  #  type: string
  #  sql: ${TABLE}.agg_run_id

  #- dimension: callback_agent_answer_time
  #  type: number
  #  sql: ${TABLE}.callback_agent_answer_time

  #- dimension: callback_customer_answer_time
  #  type: number
  #  sql: ${TABLE}.callback_customer_answer_time

  #- dimension: callback_wait_time
  #  type: number
  #  sql: ${TABLE}.callback_wait_time

  
  #- dimension: num_callbacks_abandoned
  #  type: number
  #  sql: ${TABLE}.num_callbacks_abandoned

  #- dimension: num_callbacks_answered
  #  type: number
  #  sql: ${TABLE}.num_callbacks_answered

  #- dimension: num_callbacks_attempted
  #  type: number
  #  sql: ${TABLE}.num_callbacks_attempted

  #- dimension: num_callbacks_busy
  #  type: number
  #  sql: ${TABLE}.num_callbacks_busy

  #- dimension: num_callbacks_handled
  #  type: number
  #  sql: ${TABLE}.num_callbacks_handled

  #- dimension: num_callbacks_no_answer
  #  type: number
  #  sql: ${TABLE}.num_callbacks_no_answer

  #- dimension: num_callbacks_requested
  #  type: number
  #  sql: ${TABLE}.num_callbacks_requested

  #- dimension: num_callbacks_requeued
  #  type: number
  #  sql: ${TABLE}.num_callbacks_requeued

  #- dimension: num_calls_queued
  #  type: number
  #  sql: ${TABLE}.num_calls_queued

  
  #- measure: count
  #  type: count
  #  drill_fields: [id, service_name]

