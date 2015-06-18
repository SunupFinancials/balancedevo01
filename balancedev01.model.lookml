- connection: balancedw02

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards
- persist_for: 0 hours

- explore: epic_clients
  joins:
    - join: epic_loans
      relationship: many_to_one
      sql_on: ${epic_clients.client_id} = ${epic_loans.debtor_client_id} 

    - join: epic_payments
      relationship: many_to_one
      sql_on: ${epic_loans.loan_id} = ${epic_payments.loan_id} 
      
- explore: epic_loan_history

- explore: epic_daily_outstanding_principle
  joins:
    - join: sunup_calendar
      type: inner
      relationship: one_to_one
      sql_on: ${epic_daily_outstanding_principle.date_key} = ${sunup_calendar.calendar_date_key} 

- explore: epic_loans
  joins:
    - join: epic_loan_history
      relationship: many_to_one
      sql_on: ${epic_loans.current_history_id} = ${epic_loan_history.loan_history_id} 

    - join: epic_payments
      relationship: many_to_one
      sql_on: ${epic_loans.loan_id} = ${epic_payments.loan_id} 
    
    - join: sunup_calendar
      relationship: many_to_one
      sql_on: ${epic_loans.effective_date} = ${sunup_calendar.reporting_business_date} 
      
    - join: epic_clients
      relationship: many_to_one
      sql_on: ${epic_loans.debtor_client_id} = ${epic_clients.client_id}
      
    - join: epic_daily_outstanding_principle
      relationship: one_to_one
      sql_on: ${sunup_calendar.calendar_date_key} = ${epic_daily_outstanding_principle.date_key}
      
- explore: epic_payments
  joins:
    - join: epic_loans
      relationship: many_to_one
      sql_on: ${epic_loans.loan_id} = ${epic_payments.loan_id} 

    - join: sunup_calendar
      relationship: many_to_one
      sql_on: ${epic_payments.effective_date} = ${sunup_calendar.reporting_business_date} 

    - join: vw_reporting_business30_day_months
      relationship: many_to_one
      sql_on: ${epic_payments.effective_date} = ${vw_reporting_business30_day_months.calendar_date} 
      
    - join: vw_reporting_business7_day_weeks
      relationship: many_to_one
      sql_on: ${epic_payments.effective_date} = ${vw_reporting_business7_day_weeks.calendar_date} 
      
    - join: epic_daily_outstanding_principle
      relationship: one_to_one
      sql_on: ${sunup_calendar.calendar_date_key} = ${epic_daily_outstanding_principle.date_key}

- explore: sunup_calendar
  joins:
    - join: epic_daily_outstanding_principle
      type: inner
      relationship: one_to_one
      sql_on: ${sunup_calendar.calendar_date_key} = ${epic_daily_outstanding_principle.date_key}
  

- explore: vw_reporting_business30_day_months
- explore: vw_reporting_business7_day_weeks