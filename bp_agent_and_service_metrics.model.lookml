- connection: test_reporting_db

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards


- explore: agent_performance

- explore: callback_counters

- explore: concurrent_users

- explore: disposition_counters

- explore: overflow_counters

- explore: requested_skills

- explore: scenario_steps_counters

- explore: service_in_time_counters


