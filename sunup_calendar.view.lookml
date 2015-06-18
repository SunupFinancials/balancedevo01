- view: sunup_calendar
  sql_table_name: Sunup_Calendar
  fields:

  - dimension: bank_holiday_name
    sql: ${TABLE}.BankHolidayName

  - dimension_group: calendar
    type: time
    timeframes: [date, week, month, day_of_week]
    sql: ${TABLE}.CalendarDate
    
  - dimension: calendar_date_key
    type: date
    sql: ${TABLE}.CalendarDate
    primary_key: true
    hidden: true

  - dimension: calendar_day
    type: int
    sql: ${TABLE}.CalendarDay

  - dimension: su_calendar_month
    type: int
    sql: ${TABLE}.CalendarMonth

  - dimension: calendar_week_number
    type: int
    sql: ${TABLE}.CalendarWeekNumber

  - dimension: calendar_year
    type: int
    sql: ${TABLE}.CalendarYear

  - dimension: calendar_year_isoweek
    type: int
    sql: ${TABLE}.CalendarYearISOWeek

  - dimension: calendar_year_week
    type: int
    sql: ${TABLE}.CalendarYearWeek

  - dimension: calendar_year_week_label
    sql: ${TABLE}.CalendarYearWeekLabel

  - dimension: dayof_week_label
    sql: ${TABLE}.DayofWeekLabel

  - dimension: dayof_week_label_short
    sql: ${TABLE}.DayofWeekLabelShort

  - dimension: int_date
    type: int
    sql: ${TABLE}.intDate

  - dimension: int_year_isowk
    type: int
    sql: ${TABLE}.intYearISOWk

  - dimension: int_year_month
    sql: ${TABLE}.intYearMonth

  - dimension: is_bank_holiday_day
    type: int
    sql: ${TABLE}.IsBankHolidayDay

  - dimension: is_business_day
    type: int
    sql: ${TABLE}.IsBusinessDay

  - dimension_group: month_end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.MonthEndDate

  - dimension: month_label
    sql: ${TABLE}.MonthLabel

  - dimension: month_label_short
    sql: ${TABLE}.MonthLabelShort

  - dimension_group: month_start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.MonthStartDate

  - dimension: quarter
    type: int
    sql: ${TABLE}.Quarter

  - dimension: quarter_label
    sql: ${TABLE}.QuarterLabel

  - dimension: year_label
    sql: ${TABLE}.YearLabel
    
  - dimension: reporting_business_date
    type: date
    sql: ${TABLE}.ReportingBusinessDate
    
  - dimension: reporting_business_start5days
    type: date
    sql: ${TABLE}.ReportingBusinessStart5Days
    
  - dimension: reporting_business_start30days
    type: date
    sql: ${TABLE}.ReportingBusinessStart30Days

  - measure: count
    type: count
    drill_fields: [bank_holiday_name]
    
  - measure: reporting_business_5daystring
    type: string
    sql: convert(varchar(12), min(${reporting_business_start5days}),101) +' - '+ convert(varchar(12), max(${reporting_business_date}),101)
  
  - measure: reporting_business_30daystring
    type: string
    sql: convert(varchar(12), min(${reporting_business_start30days}),101) +' - '+ convert(varchar(12), max(${reporting_business_date}),101)
    
  - measure: m_ob_div1m
    type: number
    sql: NULLIF(${epic_daily_outstanding_principle.m_outstanding_balance_div1m})