- view: vw_reporting_business30_day_months
  sql_table_name: vw_ReportingBusiness30DayMonths
  fields:

  - dimension_group: calendar
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.CalendarDate

  - dimension: rbmonth_label
    sql: ${TABLE}.RBMonthLabel

  - dimension: rbmonth_num
    type: number
    sql: ${TABLE}.RBMonthNum

  - dimension_group: rbmonths_end
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.RBMonthsEnd

  - dimension_group: rbmonths_start
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.RBMonthsStart

  - dimension_group: reporting_business_asof
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.ReportingBusinessAsofDate

  - measure: count
    type: count
    drill_fields: []

