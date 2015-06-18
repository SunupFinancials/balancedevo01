- view: vw_reporting_business7_day_weeks
  sql_table_name: vw_ReportingBusiness7DayWeeks
  fields:

  - dimension_group: calendar
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.CalendarDate

  - dimension: rbweek_label
    sql: ${TABLE}.RBWeekLabel

  - dimension: rbweek_num
    type: number
    sql: ${TABLE}.RBWeekNum

  - dimension_group: rbweeks_end
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.RBWeeksEnd

  - dimension_group: rbweeks_start
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.RBWeeksStart

  - dimension_group: reporting_business_asof
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.ReportingBusinessAsofDate

  - measure: count
    type: count
    drill_fields: []

