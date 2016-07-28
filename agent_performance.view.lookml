
# Contains aggregated data for agents and teams 

- view: agent_performance
  sql_table_name: |
      `nationalcredit_b`.agent_performance
  fields:
  
  # For data field descriptions see 
  # http://www.brightpattern.com/doc/Documentation/ServicePattern/3.12/reporting-database-specification/agent_performance
  
  
  
  # This section contains dimensions for all agent and team reports
  
  - dimension: name
    label: 'Name'
    sql: CONCAT(${TABLE}.first_name,' ',${TABLE}.last_name)
  
  - dimension: first_name
    label: 'First Name'
    type: string
    sql: ${TABLE}.first_name
  
  - dimension: last_name
    label: 'Last Name'
    type: string
    sql: ${TABLE}.last_name

  - dimension: username
    label: 'Username'
    type: string
    sql: ${TABLE}.login_id
    
  - dimension: team
    label: 'Team'
    type: string
    sql: ${TABLE}.team_name  
    
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
    
  - dimension: service
    label: 'Service'
    type: string
    sql: ${TABLE}.service_name
  
  - dimension: is_campaign
    label: 'Is Campaign'
    type: string
    sql: ${TABLE}.is_campaign

  - dimension: is_internal
    label: 'Is Internal'
    type: string
    sql: ${TABLE}.is_internal

  - dimension: media_type
    label: 'Media Type'
    type: string
    sql: ${TABLE}.media_type
  
  - dimension: not_ready_reason
    label: 'Not Ready Reason'
    type: string
    sql: ${TABLE}.not_ready_reason

  - dimension: grade_name
    label: 'Grade Name'
    type: string
    sql: ${TABLE}.grade_name
  
  
  # This section contails measures for non-media-specific agent metrics 
  
  - measure: total_agent_logon_time
    label: 'Total Logon Time (seconds)'
    type: sum
    sql: ${TABLE}.total_login_time 
    
  - measure: total_agent_logon_time_formatted
    label: 'Total Logon Time'
    type: sum
    sql: cast(${TABLE}.total_login_time as decimal(10,6))/86400
    value_format: '[h]:mm:ss'  
    
  - measure: total_agent_working_time
    label: 'Total Working Time (seconds)'
    type: sum
    sql: ${TABLE}.total_working_time
    
  - measure: total_agent_working_time_formatted
    label: 'Total Working Time'
    type: sum
    sql: cast(${TABLE}.total_working_time as decimal(10,6))/86400
    value_format: '[h]:mm:ss'  
    
  - measure: total_not_ready
    label: 'Total Not Ready Time'
    type: sum
    sql: ${TABLE}.not_ready_time
    
  - measure: not_ready_percent
    label: 'Not Ready %'
    type: number
    sql: 100.00 * ${total_not_ready} / ${total_agent_logon_time}
    value_format: '0.0'    

  - measure: total_ready
    label: 'Total Ready Time'
    type: sum
    sql: ${TABLE}.total_ready_time
    
  - measure: ready_percent
    label: 'Ready %'
    type: number
    sql: 100.00 * ${total_ready} / ${total_agent_logon_time}
    value_format: '0.0'  
  
  - measure: graded_interactions
    label: 'Graded Interactions'
    type: sum
    sql: ${TABLE}.grade_count

  - measure: grade_total_value
    label: 'Grade Total Value'
    type: sum
    sql: ${TABLE}.grade_total_value
  
    
  
  # This section contails measures for metrics that appear in the Agent Perfomance Report and other aggregate agent and team reports for voice and chat
  
  - measure: num_calls_handled
    label: 'Number of Calls Handled'
    type: sum
    sql: ${TABLE}.num_calls_answered
    
  - measure: total_handling_time_inbound
    label: 'Total Handling Time (inbound)'
    type: sum
    sql: (${TABLE}.total_busy_time_in + ${TABLE}.total_acw_time_in)
    
  - measure: average_handling_time_inbound
    label: 'Average Handling Time Inbound (seconds)'
    type: number
    sql: ${total_handling_time_inbound} / ${num_calls_handled}
    
  - measure: average_handling_time_inbound_formatted
    label: 'Average Handling Time (inbound)'
    type: number
    sql: cast(${average_handling_time_inbound} as decimal(10,6))/86400
    value_format: '[h]:mm:ss'   
    
  - measure: num_calls_made
    label: 'Number of Calls Made'
    type: sum
    sql: ${TABLE}.num_calls_answered_outbound
    
  - measure: total_handling_time_outbound
    label: 'Total Handling Time (outbound)'
    type: sum
    sql: (${TABLE}.total_busy_time_out + ${TABLE}.total_acw_time_out)
  
  - measure: average_handling_time_outbound
    label: 'Average Handling Time Outbound (seconds)'
    type: number
    sql: ${total_handling_time_outbound} / ${num_calls_made}
    
  - measure: average_handling_time_outbound_formatted
    label: 'Average Handling Time (outbound)'
    type: number
    sql: cast(${average_handling_time_outbound} as decimal(10,6))/86400
    value_format: '[h]:mm:ss' 
  
  - measure: calls_not_answered
    label: 'Calls Not Answered'
    type: sum
    sql: ${TABLE}.num_calls_no_answer  # also used for Emails Not Accepted

  - measure: calls_rejected
    label: 'Calls Rejected'
    type: sum
    sql: ${TABLE}.num_calls_rejected

  - measure: call_rejects_no_answer
    label: 'Call Rejected and Not Answered'
    type: sum
    sql: (${TABLE}.num_calls_rejected + ${TABLE}.num_calls_no_answer)
    
  - measure: initiated_transfers
    label: 'Initiated Transfers'
    type: sum
    sql: ${TABLE}.num_initiated_transfers  # also used for Emails Processed Transferred
    
  - measure: total_busy_inbound
    label: 'Total Busy Time (inbound)'
    type: sum
    sql: ${TABLE}.total_busy_time_in

  - measure: total_busy_outbound
    label: 'Total Busy Time (outbound)'
    type: sum
    sql: ${TABLE}.total_busy_time_out  
    
  - measure: total_after_call_work
    label: 'Total After Call Work Time'
    type: sum
    sql: (${TABLE}.total_acw_time_in + ${TABLE}.total_acw_time_out)
    
  - measure: total_ringing_time
    label: 'Total Ringing Time'
    type: sum
    sql: (${TABLE}.total_ringing_time_in + ${TABLE}.total_ringing_time_out)
    
  - measure: occupancy
    label: 'Occupancy'
    type: number
    sql: 100.00 * (${total_handling_time_inbound} + ${total_handling_time_outbound}) / ${total_agent_working_time}
    value_format: '0.0'
  
  
  - measure: number_of_surveys
    label: 'Number of Surveys'
    type: sum
    sql: ${TABLE}.num_surveys
    
  - measure: fcr_count
    label: 'First Call Resolution'
    type: sum
    sql: ${TABLE}.num_fcr
    
  - measure: number_of_surveys_with_fcr
    label: 'Number of Surveys with FCR'
    type: sum
    sql: ${TABLE}.num_surveys_with_fcr 
    
  - measure: cs_count
    label: 'Customer Satisfaction'
    type: sum
    sql: ${TABLE}.cs
    
  - measure: number_of_surveys_with_cs
    label: 'Number of Surveys with CS'
    type: sum
    sql: ${TABLE}.num_surveys_with_cs   
    
  - measure: nps_count
    label: 'Net Promoter Score'
    type: sum
    sql: ${TABLE}.nps
    
  - measure: number_of_surveys_with_nps
    label: 'Number of Surveys with NPS'
    type: sum
    sql: ${TABLE}.num_surveys_with_nps  
      
  
    
  # This section contails measures for metrics that appear in the Agent and Team Email Reports 
  
  - measure: emails_offered
    label: 'Emails Offered'
    type: sum
    sql: ${TABLE}.num_calls_in
    
  - measure: emails_not_accepted
    label: 'Emails Not Accepted'
    type: sum
    sql: ${TABLE}.num_calls_no_answer

  - measure: emails_pulled
    label: 'Emails Pulled'
    type: sum
    sql: ${TABLE}.num_emails_pulled

  - measure: emails_assigned
    label: 'Emails Assigned'
    type: sum
    sql: ${TABLE}.num_emails_received_as_transfers

  - measure: emails_carried_over
    label: 'Emails Carried Over'
    type: sum
    sql: ${TABLE}.num_emails_in_carried_over

  - measure: emails_processed_service_changed
    label: 'Emails Processed Service Changed'
    type: sum
    sql: ${TABLE}.num_emails_in_service_changed  
  
  - measure: emails_processed_transferred
    label: 'Emails Processed Transferred'
    type: sum
    sql: ${TABLE}.num_initiated_transfers
  
  - measure: emails_processed_closed
    label: 'Emails Processed Closed'
    type: sum
    sql: ${TABLE}.num_emails_closed_without_reply

  - measure: emails_processed_replied
    label: 'Emails Processed Replied'
    type: sum
    sql: ${TABLE}.num_emails_replied_by_agent

  - measure: emails_processed_total
    label: 'Emails Processed Total'
    type: sum
    sql: (${TABLE}.num_emails_in_service_changed + ${TABLE}.num_initiated_transfers + ${TABLE}.num_emails_closed_without_reply + ${TABLE}.num_emails_replied_by_agent)
  
  - measure: emails_remaining
    label: 'Emails Remaining'
    type: sum
    sql: ${TABLE}.num_emails_in_waiting_in_personal_queues

  - measure: email_total_reply_time
    label: 'Email Total Reply Time'
    type: sum
    sql: ${TABLE}.email_answer_time
    
  - measure: email_total_in_focus_time
    label: 'Email Total In-focus Time'
    type: sum
    sql: (${TABLE}.total_busy_time_in + ${TABLE}.total_hold_time_in)
    
  - measure: email_total_out_of_focus_time
    label: 'Email Total Out-of-focus Time'
    type: sum
    sql: ${TABLE}.total_hold_time_in
   
  - measure: email_total_acw_time
    label: 'Email Total ACW Time'
    type: sum
    sql: ${TABLE}.total_handling_acw_time_in 
   
  - measure: emails_outbound_sent
    label: 'Emails Outbound Sent'
    type: sum
    sql: ${TABLE}.num_calls_out
  
  - measure: emails_outbound_discarded
    label: 'Emails Outbound Discarded'
    type: sum
    sql: ${TABLE}.num_emails_discarded

  
  

  #- dimension: id
  #  primary_key: true
  #  type: string
  #  sql: ${TABLE}.id

  #- dimension: agg_run_id
  #  type: string
  #  sql: ${TABLE}.agg_run_id

  #- dimension: cs
  #  type: number
  #  sql: ${TABLE}.cs

  #- dimension: email_answer_time
  #  type: number
  #  sql: ${TABLE}.email_answer_time


  #- dimension: grade_count
  #  type: number
  #  sql: ${TABLE}.grade_count

  
  #- dimension: grade_order_num
  #  type: number
  #  sql: ${TABLE}.grade_order_num

  #- dimension: grade_total_value
  #  type: number
  #  sql: ${TABLE}.grade_total_value

  #- dimension: no_service
  #  type: string
  #  sql: ${TABLE}.no_service

  #- dimension: not_ready_time
  #  type: number
  #  sql: ${TABLE}.not_ready_time

  #- dimension: nps
  #  type: number
  #  sql: ${TABLE}.nps

  #- dimension: num_calls_agent_abandoned
  #  type: number
  #  sql: ${TABLE}.num_calls_agent_abandoned

  #- dimension: num_calls_answered
  #  type: number
  #  sql: ${TABLE}.num_calls_answered

  #- dimension: num_calls_answered_outbound
  #  type: number
  #  sql: ${TABLE}.num_calls_answered_outbound

  #- dimension: num_calls_graded
  #  type: number
  #  sql: ${TABLE}.num_calls_graded

  #- dimension: num_calls_in
  #  type: number
  #  sql: ${TABLE}.num_calls_in

  #- dimension: num_calls_no_answer
  #  type: number
  #  sql: ${TABLE}.num_calls_no_answer

  #- dimension: num_calls_out
  #  type: number
  #  sql: ${TABLE}.num_calls_out

  #- dimension: num_calls_rejected
  #  type: number
  #  sql: ${TABLE}.num_calls_rejected

  #- dimension: num_emails_closed_without_reply
  #  type: number
  #  sql: ${TABLE}.num_emails_closed_without_reply

  #- dimension: num_emails_discarded
  #  type: number
  #  sql: ${TABLE}.num_emails_discarded

  #- dimension: num_emails_in_carried_over
  #  type: number
  #  sql: ${TABLE}.num_emails_in_carried_over

  #- dimension: num_emails_in_service_changed
  #  type: number
  #  sql: ${TABLE}.num_emails_in_service_changed

  #- dimension: num_emails_in_waiting_in_personal_queues
  #  type: number
  #  sql: ${TABLE}.num_emails_in_waiting_in_personal_queues

  #- dimension: num_emails_in_waiting_in_personal_queues_breached_sla
  #  type: number
  #  sql: ${TABLE}.num_emails_in_waiting_in_personal_queues_breached_sla

  #- dimension: num_emails_out_waiting_in_personal_queues
  #  type: number
  #  sql: ${TABLE}.num_emails_out_waiting_in_personal_queues

  #- dimension: num_emails_pulled
  #  type: number
  #  sql: ${TABLE}.num_emails_pulled

  #- dimension: num_emails_received_as_transfers
  #  type: number
  #  sql: ${TABLE}.num_emails_received_as_transfers

  #- dimension: num_emails_replied_by_agent
  #  type: number
  #  sql: ${TABLE}.num_emails_replied_by_agent

  #- dimension: num_fcr
  #  type: number
  #  sql: ${TABLE}.num_fcr

  #- dimension: num_initiated_transfers
  #  type: number
  #  sql: ${TABLE}.num_initiated_transfers

  #- dimension: num_surveys
  #  type: number
  #  sql: ${TABLE}.num_surveys

  #- dimension: num_surveys_with_cs
  #  type: number
  #  sql: ${TABLE}.num_surveys_with_cs

  #- dimension: num_surveys_with_fcr
  #  type: number
  #  sql: ${TABLE}.num_surveys_with_fcr

  #- dimension: num_surveys_with_nps
  #  type: number
  #  sql: ${TABLE}.num_surveys_with_nps

  #- dimension: pkid
  #  type: number
  #  value_format_name: id
  #  sql: ${TABLE}.pkid

  #- dimension: rank
  #  type: string
  #  sql: ${TABLE}.rank

  
  #- dimension: total_acw_time_in
  #  type: number
  #  sql: ${TABLE}.total_acw_time_in

  #- dimension: total_acw_time_out
  #  type: number
  #  sql: ${TABLE}.total_acw_time_out

  #- dimension: total_busy_time_in
  #  type: number
  #  sql: ${TABLE}.total_busy_time_in

  #- dimension: total_busy_time_out
  #  type: number
  #  sql: ${TABLE}.total_busy_time_out

  #- dimension: total_handling_acw_time
  #  type: number
  #  sql: ${TABLE}.total_handling_acw_time

  #- dimension: total_handling_acw_time_in
  #  type: number
  #  sql: ${TABLE}.total_handling_acw_time_in

  #- dimension: total_handling_acw_time_out
  #  type: number
  #  sql: ${TABLE}.total_handling_acw_time_out

  #- dimension: total_handling_call_time
  #  type: number
  #  sql: ${TABLE}.total_handling_call_time

  #- dimension: total_handling_call_time_in
  #  type: number
  #  sql: ${TABLE}.total_handling_call_time_in

  #- dimension: total_handling_call_time_out
  #  type: number
  #  sql: ${TABLE}.total_handling_call_time_out

  #- dimension: total_handling_time
  #  type: number
  #  sql: ${TABLE}.total_handling_time

  #- dimension: total_hold_time_in
  #  type: number
  #  sql: ${TABLE}.total_hold_time_in

  #- dimension: total_hold_time_out
  #  type: number
  #  sql: ${TABLE}.total_hold_time_out

  #- dimension: total_login_time
  #  type: number
  #  sql: ${TABLE}.total_login_time

  #- dimension: total_num_calls
  #  type: number
  #  sql: ${TABLE}.total_num_calls

  #- dimension: total_ready_time
  #  type: number
  #  sql: ${TABLE}.total_ready_time

  #- dimension: total_ringing_time_in
  #  type: number
  #  sql: ${TABLE}.total_ringing_time_in

  #- dimension: total_ringing_time_out
  #  type: number
  #  sql: ${TABLE}.total_ringing_time_out

  #- dimension: total_working_time
  #  type: number
  #  sql: ${TABLE}.total_working_time

  
  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - first_name
    - last_name
    - team_name
    - service_name
    - grade_name

