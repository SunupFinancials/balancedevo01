- view: epic_daily_outstanding_principle
  sql_table_name: EpicDailyOutstandingPrinciple
  fields:

  - dimension_group: date_copied_from_epic_dart
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.DateCopiedFromEpicDart
    
  - dimension: date_key
    type: date
    hidden: true
    primary_key: true
    sql: ${TABLE}.DateCopiedFromEpicDart

  - dimension: outstanding_balance
    sql: ${TABLE}.OutstandingBalance

  - measure: count
    type: count
    drill_fields: []
  
  - measure: m_outstanding_balance_div1m
    type: min
    label: 'Outstanding Balance ($m)'
    sql: ${TABLE}.OutstandingBalanceDiv1M
    decimals: 2
    