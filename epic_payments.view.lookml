- view: epic_payments
  sql_table_name: EpicPayments
  fields:

  - dimension: ach_endpoint
    sql: ${TABLE}.AchENDpoint

  - dimension: assigned_agent
    sql: ${TABLE}.AssignedAgent

  - dimension_group: calc_1_cash_effective
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.Calc_1CashEffectiveDate

  - dimension: calc_current_mtd
    type: int
    sql: ${TABLE}.Calc_CurrentMTD

  - dimension: calc_exclude_test
    type: int
    sql: ${TABLE}.Calc_ExcludeTest

  - dimension_group: calc_failed_date
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.Calc_FailedDateTime

  - dimension_group: calc_failed_effective_date
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.Calc_FailedEffectiveDateTime

  - dimension: calc_next30_days
    type: int
    sql: ${TABLE}.Calc_Next30Days

  - dimension: calc_payment_month
    sql: ${TABLE}.Calc_PaymentMonth

  - dimension: calc_payment_week
    type: int
    sql: ${TABLE}.Calc_PaymentWeek

  - dimension_group: calc_pmt_last
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.Calc_PmtLastDate

  - dimension_group: calc_pmt_last_success
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.Calc_PmtLastSuccessDate

  - dimension: credit_reason
    type: int
    sql: ${TABLE}.CreditReason

  - dimension_group: date_copied_from_epic_dart
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.DateCopiedFromEpicDart

  - dimension_group: effective
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.EffectiveDate

  - dimension: fees_amount
    sql: ${TABLE}.FeesAmount

  - dimension: finance_fee
    sql: ${TABLE}.FinanceFee

  - dimension: is_debit
    type: int
    sql: ${TABLE}.IsDebit

  - dimension: is_origination
    type: int
    sql: ${TABLE}.IsOrigination

  - dimension: late_fee
    sql: ${TABLE}.LateFee

  - dimension: loan_id
    type: int
    sql: ${TABLE}.LoanId

  - dimension: loan_payment_number
    type: number
    sql: ${TABLE}.LoanPaymentNumber

  - dimension: nsf_fee
    sql: ${TABLE}.NsfFee

  - dimension: payment_agent
    sql: ${TABLE}.PaymentAgent


  - dimension: payment_id
    type: int
    primary_key: true
    sql: ${TABLE}.Payment_Id

  - dimension: payment_status
    sql: ${TABLE}.PaymentStatus

  - dimension: payment_type
    sql: ${TABLE}.PaymentType

  - dimension: principle
    sql: ${TABLE}.Principle

  - dimension: return_code
    sql: ${TABLE}.ReturnCode

  - dimension_group: return
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.ReturnDate

  - dimension_group: success
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.SuccessDate

  - dimension: vw_payments_id
    type: int
    sql: ${TABLE}.vw_Payments_Id

  - measure: count
    type: count
    drill_fields: []
    
  - measure: payment_amount
    type: sum
    sql: ${TABLE}.PaymentAmount
  
  - measure: origination_payment_amount
    type: sum
    sql: ${TABLE}.PaymentAmount
    filters:
      is_origination: 1
      
  - measure: origination_count
    type: count
    filters:
      is_origination: 1
      
  - measure: origination_average
    type: number
    sql: (${origination_payment_amount}*1.00) / NULLIF((${origination_count}*1.00),0)
      
  - measure: payments_submitted
    type: sum
    sql: ${TABLE}.PaymentAmount
    filters:
      is_origination: 0
      payment_status: Checked,Rejected
      payment_type: -Cash,-Loan Transfer
      
  - measure: payments_rejected
    type: sum
    sql: ${TABLE}.PaymentAmount
    filters:
      is_origination: 0
      payment_status: Rejected
      payment_type: -Cash,-Loan Transfer
      
  - measure: payment_ret_percent
    label: 'Ret %'
    type: number
    value_format: '#.0\%'
    sql: 100.00 * ((${payments_rejected}*1.00) / NULLIF((${payments_submitted}*1.00),0))

    
  - measure: payment1_total_count
    label: 'Total 1 P'
    type: count
    filters:
      loan_payment_number: 1
      is_debit: 1
      payment_status: Checked,Rejected
      payment_type: -Cash,-Loan Transfer
    
  - measure: payment2_total_count
    type: count
    filters:
      loan_payment_number: 2
      is_debit: 1
      payment_status: Checked,Rejected
      payment_type: -Cash,-Loan Transfer
        
  - measure: payment1_rejected_count
    type: count
    filters:
      loan_payment_number: 1
      is_debit: 1
      payment_status: Rejected
      payment_type: -Cash,-Loan Transfer
    
  - measure: payment2_rejected_count
    type: count
    filters:
      loan_payment_number: 2
      is_debit: 1
      payment_status: Rejected
      payment_type: -Cash,-Loan Transfer
      
  - measure: payment1_percent
    label: 'PD 1'
    type: number
    value_format: '#.0\%'
    sql: 100.00 * ((${payment1_rejected_count}*1.00) / NULLIF((${payment1_total_count}*1.00),0))
      
  - measure: payment2_percent
    label: 'PD 2'
    type: number
    value_format: '#.0\%'
    sql: 100.00 *((${payment2_rejected_count}*1.00) / NULLIF((${payment2_total_count}*1.00),0))