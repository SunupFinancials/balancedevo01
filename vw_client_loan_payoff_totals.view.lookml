- view: vw_client_loan_payoff_totals
  sql_table_name: vwClientLoanPayoffTotals
  fields:

  - dimension: annual_percent_rate
    type: number
    sql: ${TABLE}.AnnualPercentRate

  - dimension_group: calendar
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.CalendarDate

  - dimension: collection_queue
    sql: ${TABLE}.CollectionQueue

  - dimension_group: collection_start
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.CollectionStartDate

  - dimension: daily_apraccured
    type: number
    sql: ${TABLE}.DailyAPRAccured

  - dimension: days_since_last_payment
    type: int
    sql: ${TABLE}.DaysSinceLastPayment

  - dimension: days_till_nextpayment
    type: int
    sql: ${TABLE}.DaysTillNEXTPayment

  - dimension: display_number
    sql: ${TABLE}.DisplayNumber

  - dimension: full_name
    sql: ${TABLE}.FullName

  - dimension: loan_id
    type: int
    sql: ${TABLE}.LoanId

  - dimension: loan_status
    sql: ${TABLE}.LoanStatus

  - dimension: missed_finance_fee_todate
    sql: ${TABLE}.MissedFinanceFeeTODATE

  - dimension_group: next_payment
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.NextPaymentDate

  - dimension: nextpayday_payoff_amount
    type: number
    sql: ${TABLE}.NEXTPaydayPayoffAmount

  - dimension: nsflate_fees_todate
    sql: ${TABLE}.NSFLateFeesTODATE

  - dimension: outstanding_principle
    type: number
    sql: ${TABLE}.OutstandingPrinciple

  - dimension: outstanding_total
    type: number
    sql: ${TABLE}.OutstandingTotal

  - dimension: principle_todate
    type: number
    sql: ${TABLE}.PrincipleTODATE

  - dimension: state
    sql: ${TABLE}.State

  - dimension: total_interest_todate
    type: number
    sql: ${TABLE}.TotalInterestTODATE

  - measure: count
    type: count
    drill_fields: [full_name]

  - measure: date_payoff_amount
    type: number
    sql: ${TABLE}.todays_payoff_total
    decimals: 2