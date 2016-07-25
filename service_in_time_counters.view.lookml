
# Contains all aggregated data for services and campaigns,
# except virtual queue data (see "callback_counters") and disposition counters (see "disposition_counters")

- view: service_in_time_counters
  sql_table_name: |
      `nationalcredit_b`.service_in_time_counters
  fields:
  
  # For data field descriptions see 
  # http://www.brightpattern.com/doc/Documentation/ServicePattern/3.12/reporting-database-specification/service_in_time_counters
  
  
  # This section contains dimensions for all service reports
  
  - dimension: service
    label: 'Service'
    type: string
    sql: ${TABLE}.service_name
  
  - dimension: media_type
    label: 'Media Type'
    type: string
    sql: ${TABLE}.media_type
    
  - dimension: team
    label: 'Team'
    type: string
    sql: ${TABLE}.team_name  
  
  - dimension: access_number
    label: 'Access Number'
    type: string
    sql: ${TABLE}.destination_phone
    
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
    
  
  # This section contains non-media-specific metrics
  
  - measure: minimum_agents
    label: 'Min Agents'
    type: min
    sql: ${TABLE}.min_agents
    
  - measure: maximum_agents
    label: 'Max Agents'
    type: max
    sql: ${TABLE}.max_agents  
  
  
  
  # This section contains measures for metrics that appear Servcie Metrics and Service in Time Reports (voice and chat)
  
  - measure: number_of_calls_received 
    label: 'Number of Calls Received'
    type: sum
    sql: ${TABLE}.num_calls_received  # also used for total emails received
    
  - measure: received_as_transfers 
    label: 'Received as Transfers'
    type: sum
    sql: ${TABLE}.num_calls_received_as_transfers  #also used for emails received by transfer
  
  - measure: answered_in_sl  
    label: 'Answered in SL'
    type: sum
    sql: ${TABLE}.num_calls_in_service_level   # also used for emails replied in service level
    
  - measure: self_service
    label: 'Self Service'
    type: sum
    sql: ${TABLE}.num_calls_self_service   
    
  - measure: abandoned_in_ivr
    label: 'Abandoned in IVR'
    type: sum
    sql: ${TABLE}.num_calls_abandoned_in_ivr  
    
  - measure: queued
    label: 'Queued'
    type: sum
    sql: ${TABLE}.num_calls_queued  
    
  - measure: abandoned_after_threshold
    label: 'Abandoned'
    type: sum
    sql: ${TABLE}.num_calls_abandoned_after_threshold
    
  - measure: total_abandonment_time_after_threshold
    label: 'Total Abandonment Time'
    type: sum
    sql: ${TABLE}.abandonment_time_after_threshold
    
  - measure: overflow
    label: 'Overflow'
    type: sum
    sql: ${TABLE}.num_overflow_calls   
    
  - measure: number_of_calls_answered
    label: 'Answered'
    type: sum
    sql: ${TABLE}.num_calls_answered  
    
  - measure: total_answer_time
    label: 'Total Answer Time'
    type: sum
    sql: ${TABLE}.answer_time  
    
  - measure: total_handling_time_inbound
    label: 'Total Handling Time (inbound)'
    type: sum
    sql: (${TABLE}.busy_time_in + ${TABLE}.acw_time_in)  
    
  - measure: total_talk_time_inbound
    label: 'Total Talk Time (inbound)'
    type: sum
    sql: (${TABLE}.busy_time_in - ${TABLE}.hold_time_in)
    
  - measure: total_hold_time_inbound
    label: 'Total Hold Time (inbound)'
    type: sum
    sql: ${TABLE}.hold_time_in
    
  - measure: number_of_calls_held
    label: 'Number of Calls Held'
    type: sum
    sql: ${TABLE}.num_calls_held  
    
  - measure: total_acw_time_inbound
    label: 'Total Wrap-up Time (inbound)'
    type: sum
    sql: ${TABLE}.acw_time_in  
    
  - measure: number_of_calls_made 
    label: 'Number of Calls Made'
    type: sum
    sql: ${TABLE}.num_calls_outbound  # also used for outbound emails sent
    
  - measure: number_of_calls_made_and_answered
    label: 'Number of Calls Made and Answered'
    type: sum
    sql: ${TABLE}.num_calls_answered_outbound   
    
  - measure: total_handling_time_outbound
    label: 'Total Handling Time (outbound)'
    type: sum
    sql: (${TABLE}.busy_time_out + ${TABLE}.acw_time_out)  
    
  - measure: total_talk_time_outbound
    label: 'Total Talk Time (outbound)'
    type: sum
    sql: (${TABLE}.busy_time_out - ${TABLE}.hold_time_out)
    
  - measure: total_hold_time_outbound
    label: 'Total Hold Time (outbound)'
    type: sum
    sql: ${TABLE}.hold_time_out
    
  - measure: total_acw_time_outbound
    label: 'Total Wrap-up Time (outbound)'
    type: sum
    sql: ${TABLE}.acw_time_out
    
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
    
  
  
  # This section contains measures for metrics that appear in the Campaign in Time report and Telemarketing Compliance Report
  
  - measure: campaign_num_records_completed
    label: 'Campaign Records Completed'
    type: sum
    sql: ${TABLE}.campaign_records_completed  
    
  - measure: campaign_num_records_excluded
    label: 'Campaign Records Excluded'
    type: sum
    sql: ${TABLE}.campaign_records_excluded  
    
  - measure: campaign_dialed
    label: 'Campaign Dialed'
    type: sum
    sql: ${TABLE}.campaign_calls_attempted  
    
  - measure: campaign_queued
    label: 'Campaign Queued'
    type: sum
    sql: ${TABLE}.campaign_calls_queued    
    
  # - measure: live_answered
  #   label: 'Live Answered'
  #   for now assume Live Answered = Campaign Answered
  
  - measure: campaign_abandoned
    label: 'Campaign Abandoned'
    type: sum
    sql: ${TABLE}.campaign_calls_abandoned
    
  - measure: campaign_unattended
    label: 'Campaign Unattended'
    type: sum
    sql: ${TABLE}.campaign_calls_unattended
  
  - measure: campaign_answered
    label: 'Campaign Answered'
    type: sum
    sql: ${TABLE}.campaign_calls_ivr
  
  - measure: campaign_dropped
    label: 'Campaign Dropped'
    type: sum
    sql: (${TABLE}.campaign_calls_queued - ${TABLE}.campaign_calls_abandoned - ${TABLE}.campaign_calls_handled)  
    
  - measure: campaign_handled
    label: 'Campaign Handled'
    type: sum
    sql: ${TABLE}.campaign_calls_handled 
    
  - measure: campaign_total_connection_time
    label: 'Campaign Total Connection Time'
    type: sum
    sql: ${TABLE}.campaign_answer_time   
    
  - measure: campaign_total_handle_time
    label: 'Campaign Total Handling Time'
    type: sum
    sql: (${TABLE}.campaign_talk_time + ${TABLE}.campaign_hold_time + ${TABLE}.campaign_acw_time)
    
  - measure: campaign_total_talk_time
    label: 'Campaign Total Talk Time'
    type: sum
    sql: ${TABLE}.campaign_talk_time
    
  - measure: campaign_total_hold_time
    label: 'Campaign Total Hold Time'
    type: sum
    sql: ${TABLE}.campaign_hold_time
    
  - measure: campaign_total_acw_time
    label: 'Campaign Total ACW Time'
    type: sum
    sql: ${TABLE}.campaign_acw_time
    
  - measure: campaign_preview_records_viewed
    label: 'Campaign Preview Records Viewed'
    type: sum
    sql: ${TABLE}.campaign_preview_items  
    
  - measure: campaign_total_preview_time
    label: 'Campaign Total Preview Time'
    type: sum
    sql: ${TABLE}.campaign_preview_time   


  # This section contains measures that appear in the Email Service Report
  
  - measure: emails_received 
    label: 'Emails Received'
    type: sum
    sql: ${TABLE}.num_calls_received  
   
  - measure: emails_received_new
    label: 'Emails Received New'
    type: sum
    sql: ${TABLE}.num_emails_received_new
    
  - measure: emails_received_by_transfer 
    label: 'Emails Received by Transfer'
    type: sum
    sql: ${TABLE}.num_calls_received_as_transfers  
  
  - measure: emails_received_by_service_change
    label: 'Emails Received by Service Change'
    type: sum
    sql: ${TABLE}.num_emails_in_service_changed_received  
  
  - measure: emails_carried_over
    label: 'Emails Carried Over'
    type: sum
    sql: ${TABLE}.num_emails_carried_over

  - measure: emails_carried_over_new
    label: 'Emails Carried Over New'
    type: sum
    sql: ${TABLE}.num_emails_carried_over_new

  - measure: emails_processed_closed
    label: 'Emails Processed Closed'
    type: sum
    sql: ${TABLE}.num_emails_closed_without_reply
  
  - measure: emails_processed_service_changed
    label: 'Emails Processed Service Changed'
    type: sum
    sql: ${TABLE}.num_emails_in_service_changed
  
  - measure: emails_processed_transferred
    label: 'Emails Processed Transferred'
    type: sum
    sql: ${TABLE}.num_calls_transferred_internally
    
  - measure: emails_processed_replied
    label: 'Emails Processed Replied'
    type: sum
    sql: ${TABLE}.num_emails_replied_by_agent
    
  - measure: replied_in_sl  
    label: 'Emails Replied in SL'
    type: sum
    sql: ${TABLE}.num_calls_in_service_level   
      
    
  - measure: emails_processed_total
    label: 'Emails Processed Total'
    type: sum
    sql: (${TABLE}.num_emails_closed_without_reply + ${TABLE}.num_emails_in_service_changed + ${TABLE}.num_calls_transferred_internally + ${TABLE}.num_emails_replied_by_agent)
  
  - measure: emails_remaining
    label: 'Emails Remaining'
    type: sum
    sql: ${TABLE}.num_emails_remaining_in_personal_queues

  - measure: emails_outbound_sent 
    label: 'Emails Outbound Sent'
    type: sum
    sql: ${TABLE}.num_calls_outbound  # also used for outbound emails sent
  
  - measure: total_email_reply_time
    label: 'Total Email Reply Time'
    type: sum
    sql: ${TABLE}.email_reply_time






  #- measure: total_email_routing_time
  #  label: 'Total Email Routing Time'
  #  type: sum
  #  sql: ${TABLE}.email_routing_time



  # - dimension: id
  #  primary_key: true
  #  type: string
  #  sql: ${TABLE}.id

  #- dimension: abandonment_time
  #  type: number
  #  sql: ${TABLE}.abandonment_time

  #- dimension: abandonment_time_after_threshold
  #  type: number
  #  sql: ${TABLE}.abandonment_time_after_threshold

  #- dimension: abandonment_time_after_threshold_queued
  #  type: number
  #  sql: ${TABLE}.abandonment_time_after_threshold_queued

  #- dimension: abandonment_time_queued
  #  type: number
  #  sql: ${TABLE}.abandonment_time_queued

  #- dimension: acw_time
  #  type: number
  #  sql: ${TABLE}.acw_time

  #- dimension: acw_time_in
  #  type: number
  #  sql: ${TABLE}.acw_time_in

  #- dimension: acw_time_out
  #  type: number
  #  sql: ${TABLE}.acw_time_out

  #- dimension: agg_run_id
  #  type: string
  #  sql: ${TABLE}.agg_run_id

  #- dimension: answer_time
  #  type: number
  #  sql: ${TABLE}.answer_time

  #- dimension: answer_time_queued
  #  type: number
  #  sql: ${TABLE}.answer_time_queued

  #- dimension: assigned_handling_acw_time
  #  type: number
  #  sql: ${TABLE}.assigned_handling_acw_time

  #- dimension: assigned_handling_call_time
  #  type: number
  #  sql: ${TABLE}.assigned_handling_call_time

  #- dimension: busy_time_in
  #  type: number
  #  sql: ${TABLE}.busy_time_in

  #- dimension: busy_time_out
  #  type: number
  #  sql: ${TABLE}.busy_time_out

  #- dimension: campaign_abandonment_time
  #  type: number
  #  sql: ${TABLE}.campaign_abandonment_time

  #- dimension: campaign_acw_time
  #  type: number
  #  sql: ${TABLE}.campaign_acw_time

  #- dimension: campaign_answer_time
  #  type: number
  #  sql: ${TABLE}.campaign_answer_time

  #- dimension: campaign_assigned_handling_acw_time
  #  type: number
  #  sql: ${TABLE}.campaign_assigned_handling_acw_time

  #- dimension: campaign_assigned_handling_call_time
  #  type: number
  #  sql: ${TABLE}.campaign_assigned_handling_call_time

  #- dimension: campaign_calls_abandoned
  #  type: number
  #  sql: ${TABLE}.campaign_calls_abandoned

  #- dimension: campaign_calls_attempted
  #  type: number
  #  sql: ${TABLE}.campaign_calls_attempted

  #- dimension: campaign_calls_handled
  #  type: number
  #  sql: ${TABLE}.campaign_calls_handled

  #- dimension: campaign_calls_held
  #  type: number
  # sql: ${TABLE}.campaign_calls_held

  #- dimension: campaign_calls_ivr
  #  type: number
  #  sql: ${TABLE}.campaign_calls_ivr

  #- dimension: campaign_calls_queued
  #  type: number
  #  sql: ${TABLE}.campaign_calls_queued

  #- dimension: campaign_calls_rpc
  #  type: number
  #  sql: ${TABLE}.campaign_calls_rpc

  #- dimension: campaign_calls_unattended
  #  type: number
  #  sql: ${TABLE}.campaign_calls_unattended

  #- dimension: campaign_dialer_calls_handled
  #  type: number
  #  sql: ${TABLE}.campaign_dialer_calls_handled

  #- dimension: campaign_dialer_calls_queued
  #  type: number
  #  sql: ${TABLE}.campaign_dialer_calls_queued

  #- dimension: campaign_handling_acw_time
  #  type: number
  #  sql: ${TABLE}.campaign_handling_acw_time

  #- dimension: campaign_handling_call_time
  #  type: number
  #  sql: ${TABLE}.campaign_handling_call_time

  #- dimension: campaign_hold_time
  #  type: number
  #  sql: ${TABLE}.campaign_hold_time

  #- dimension: campaign_ivr_time
  #  type: number
  #  sql: ${TABLE}.campaign_ivr_time

  #- dimension: campaign_preview_items
  #  type: number
  #  sql: ${TABLE}.campaign_preview_items

  #- dimension: campaign_preview_time
  #  type: number
  #  sql: ${TABLE}.campaign_preview_time

  #- dimension: campaign_queue_time
  #  type: number
  #  sql: ${TABLE}.campaign_queue_time

  #- dimension: campaign_records_completed
  #  type: number
  #  sql: ${TABLE}.campaign_records_completed

  #- dimension: campaign_records_dialed
  #  type: number
  #  sql: ${TABLE}.campaign_records_dialed

  #- dimension: campaign_records_excluded
  #  type: number
  #  sql: ${TABLE}.campaign_records_excluded

  #- dimension: campaign_records_handled
  #  type: number
  #  sql: ${TABLE}.campaign_records_handled

  #- dimension: campaign_records_queued
  #  type: number
  #  sql: ${TABLE}.campaign_records_queued

  #- dimension: campaign_records_rpc
  #  type: number
  #  sql: ${TABLE}.campaign_records_rpc

  #- dimension: campaign_records_valid
  #  type: number
  #  value_format_name: id
  #  sql: ${TABLE}.campaign_records_valid

  #- dimension: campaign_talk_time
  #  type: number
  #  sql: ${TABLE}.campaign_talk_time

  #- dimension: cs
  #  type: number
  #  sql: ${TABLE}.cs

  
  #- dimension: email_reply_time
  #  type: number
  #  sql: ${TABLE}.email_reply_time

  #- dimension: email_routing_time
  #  type: number
  #  sql: ${TABLE}.email_routing_time

  

  #- dimension: handling_acw_time
  #  type: number
  #  sql: ${TABLE}.handling_acw_time

  #- dimension: handling_call_time
  #  type: number
  #  sql: ${TABLE}.handling_call_time

  #- dimension: handling_time
  #  type: number
  #  sql: ${TABLE}.handling_time

  #- dimension: hold_time_in
  #  type: number
  #  sql: ${TABLE}.hold_time_in

  #- dimension: hold_time_out
  #  type: number
  #  sql: ${TABLE}.hold_time_out

  #- dimension: login_time
  #  type: number
  #  sql: ${TABLE}.login_time

  #- dimension: max_agents
  #  type: number
  #  sql: ${TABLE}.max_agents

  
  #  - dimension: min_agents
  #  type: number
  #  sql: ${TABLE}.min_agents

  #- dimension: not_ready_time
  #  type: number
  #  sql: ${TABLE}.not_ready_time

  #- dimension: nps
  #  type: number
  #  sql: ${TABLE}.nps

  #- dimension: num_calls_abandoned
  #  type: number
  #  sql: ${TABLE}.num_calls_abandoned

  #- dimension: num_calls_abandoned_after_threshold
  #  type: number
  #  sql: ${TABLE}.num_calls_abandoned_after_threshold

  #- dimension: num_calls_abandoned_in_ivr
  #  type: number
  #  sql: ${TABLE}.num_calls_abandoned_in_ivr

  #- dimension: num_calls_answered
  #  type: number
  #  sql: ${TABLE}.num_calls_answered

  #- dimension: num_calls_answered_outbound
  #  type: number
  #  sql: ${TABLE}.num_calls_answered_outbound

  #- dimension: num_calls_held
  #  type: number
  #  sql: ${TABLE}.num_calls_held

  #- dimension: num_calls_held_outbound
  #  type: number
  #  sql: ${TABLE}.num_calls_held_outbound

  #- dimension: num_calls_in_service_level
  #  type: number
  #  sql: ${TABLE}.num_calls_in_service_level

  #- dimension: num_calls_outbound
  #  type: number
  #  sql: ${TABLE}.num_calls_outbound

  #- dimension: num_calls_queued
  #  type: number
  #  sql: ${TABLE}.num_calls_queued

  #- dimension: num_calls_queued_abandoned
  #  type: number
  #  sql: ${TABLE}.num_calls_queued_abandoned

  #- dimension: num_calls_queued_abandoned_after_threshold
  #  type: number
  #  sql: ${TABLE}.num_calls_queued_abandoned_after_threshold

  #- dimension: num_calls_queued_answered
  #  type: number
  #  sql: ${TABLE}.num_calls_queued_answered

  #- dimension: num_calls_queued_held
  #  type: number
  #  sql: ${TABLE}.num_calls_queued_held

  #- dimension: num_calls_queued_in_service_level
  #  type: number
  #  sql: ${TABLE}.num_calls_queued_in_service_level

  # - dimension: num_calls_received
  #  type: number
  #  sql: ${TABLE}.num_calls_received

  #- dimension: num_calls_received_as_transfers
  #  type: number
  #  sql: ${TABLE}.num_calls_received_as_transfers

  #- dimension: num_calls_received_as_transfers_from_other_service
  #  type: number
  #  sql: ${TABLE}.num_calls_received_as_transfers_from_other_service

  #- dimension: num_calls_received_as_transfers_from_same_service
  #  type: number
  #  sql: ${TABLE}.num_calls_received_as_transfers_from_same_service

  #- dimension: num_calls_recv_as_transfers_abandoned
  #  type: number
  #  sql: ${TABLE}.num_calls_recv_as_transfers_abandoned

  #- dimension: num_calls_recv_as_transfers_abandoned_after_threshold
  #  type: number
  #  sql: ${TABLE}.num_calls_recv_as_transfers_abandoned_after_threshold

  #- dimension: num_calls_recv_as_transfers_abandoned_in_ivr
  #  type: number
  #  sql: ${TABLE}.num_calls_recv_as_transfers_abandoned_in_ivr

  #- dimension: num_calls_recv_as_transfers_answered
  #  type: number
  #  sql: ${TABLE}.num_calls_recv_as_transfers_answered

  #- dimension: num_calls_recv_as_transfers_held
  #  type: number
  #  sql: ${TABLE}.num_calls_recv_as_transfers_held

  #- dimension: num_calls_recv_as_transfers_in_service_level
  #  type: number
  #  sql: ${TABLE}.num_calls_recv_as_transfers_in_service_level

  #- dimension: num_calls_recv_as_transfers_queued
  #  type: number
  #  sql: ${TABLE}.num_calls_recv_as_transfers_queued

  #- dimension: num_calls_self_service
  #  type: number
  #  sql: ${TABLE}.num_calls_self_service

  #- dimension: num_calls_transferred_externally
  #  type: number
  #  sql: ${TABLE}.num_calls_transferred_externally

  #- dimension: num_calls_transferred_internally
  #  type: number
  #  sql: ${TABLE}.num_calls_transferred_internally

  #- dimension: num_emails_carried_over
  #  type: number
  #  sql: ${TABLE}.num_emails_carried_over

  #- dimension: num_emails_carried_over_new
  #  type: number
  #  sql: ${TABLE}.num_emails_carried_over_new

  #- dimension: num_emails_closed_without_reply
  #  type: number
  #  sql: ${TABLE}.num_emails_closed_without_reply

  #- dimension: num_emails_in_progress
  #  type: number
  #  sql: ${TABLE}.num_emails_in_progress

  #- dimension: num_emails_in_service_changed
  #  type: number
  #  sql: ${TABLE}.num_emails_in_service_changed

  #- dimension: num_emails_in_service_changed_received
  #  type: number
  #  sql: ${TABLE}.num_emails_in_service_changed_received

  #- dimension: num_emails_received_new
  #  type: number
  #  sql: ${TABLE}.num_emails_received_new

  #- dimension: num_emails_remaining_in_personal_queues
  #  type: number
  #  sql: ${TABLE}.num_emails_remaining_in_personal_queues

  #- dimension: num_emails_remaining_in_personal_queues_breached_sla
  #  type: number
  #  sql: ${TABLE}.num_emails_remaining_in_personal_queues_breached_sla

  #- dimension: num_emails_replied_by_agent
  #  type: number
  #  sql: ${TABLE}.num_emails_replied_by_agent

  #- dimension: num_fcr
  #  type: number
  #  sql: ${TABLE}.num_fcr

  #- dimension: num_overflow_calls
  #  type: number
  #  sql: ${TABLE}.num_overflow_calls

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

  #- dimension: ready_time
  #  type: number
  #  sql: ${TABLE}.ready_time

  #- dimension: ringing_time_in
  #  type: number
  #  sql: ${TABLE}.ringing_time_in

  #- dimension: ringing_time_out
  #  type: number
  #  sql: ${TABLE}.ringing_time_out

  
  #- dimension: total_duration_in
  #  type: number
  #  sql: ${TABLE}.total_duration_in

  #- measure: count
  #  type: count
  #  drill_fields: [id, service_name, team_name]

