- view: epic_loan_history
  sql_table_name: EpicLoanHistory
  fields:

  - dimension: calc_outstanding_csofee
    sql: ${TABLE}.Calc_OutstandingCSOFee

  - dimension_group: date_copied_from_epic_dart
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.DateCopiedFromEpicDart

  - dimension: discount_finance_fee
    sql: ${TABLE}.DiscountFinanceFee

  - dimension: discount_late_fee
    sql: ${TABLE}.DiscountLateFee

  - dimension: discount_nsf_fee
    sql: ${TABLE}.DiscountNsfFee

  - dimension: discount_principle
    sql: ${TABLE}.DiscountPrinciple

  - dimension: effective_date
    sql: ${TABLE}.EffectiveDate

  - dimension: loan_history_id
    type: int
    sql: ${TABLE}.LoanHistoryId

  - dimension: loan_id
    type: int
    sql: ${TABLE}.LoanId

  - dimension: loan_status
    sql: ${TABLE}.LoanStatus

  - dimension: outstanding_finance_fee
    sql: ${TABLE}.OutstandingFinanceFee

  - dimension: outstanding_late_fee
    sql: ${TABLE}.OutstandingLateFee

  - dimension: outstanding_nsf_fee
    sql: ${TABLE}.OutstandingNsfFee

  - dimension: outstanding_principle
    sql: ${TABLE}.OutstandingPrinciple

  - dimension: outstanding_total
    sql: ${TABLE}.OutstandingTotal

  - dimension: paid_off_finance_fee
    sql: ${TABLE}.PaidOffFinanceFee

  - dimension: paid_off_late_fee
    sql: ${TABLE}.PaidOffLateFee

  - dimension: paid_off_nsf_fee
    sql: ${TABLE}.PaidOffNsfFee

  - dimension: paid_off_principle
    sql: ${TABLE}.PaidOffPrinciple

  - dimension: settlement_finance_fee
    sql: ${TABLE}.SettlementFinanceFee

  - dimension: settlement_late_fee
    sql: ${TABLE}.SettlementLateFee

  - dimension: settlement_nsf_fee
    sql: ${TABLE}.SettlementNsfFee

  - dimension: settlement_principle
    sql: ${TABLE}.SettlementPrinciple

  - dimension: vw_loan_history_id
    type: int
    sql: ${TABLE}.vw_LoanHistory_Id

  - measure: count
    type: count
    drill_fields: []

