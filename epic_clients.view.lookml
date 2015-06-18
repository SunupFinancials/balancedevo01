- view: epic_clients
  sql_table_name: EpicClients
  fields:

  - dimension: aba
    sql: ${TABLE}.Aba

  - dimension: address
    sql: ${TABLE}.Address

  - dimension: address2
    sql: ${TABLE}.Address2

  - dimension: bank_account_type
    sql: ${TABLE}.BankAccountType

  - dimension: bank_months
    type: int
    sql: ${TABLE}.BankMonths

  - dimension: bank_name
    sql: ${TABLE}.BankName

  - dimension: bank_phone
    sql: ${TABLE}.BankPhone

  - dimension: bank_years
    type: int
    sql: ${TABLE}.BankYears

  - dimension: birth_date
    sql: ${TABLE}.BirthDate

  - dimension: birth_year
    type: int
    sql: ${TABLE}.BirthYear

  - dimension: calc_exclude_test
    type: int
    sql: ${TABLE}.Calc_ExcludeTest

  - dimension: cell_phone
    sql: ${TABLE}.CellPhone

  - dimension: cell_phone_do_not_call
    type: int
    sql: ${TABLE}.CellPhoneDoNotCall

  - dimension: city
    sql: ${TABLE}.City

  - dimension: client_id
    type: int
    sql: ${TABLE}.ClientId

  - dimension: contact_time
    sql: ${TABLE}.ContactTime

  - dimension: customer_account
    sql: ${TABLE}.CustomerAccount

  - dimension_group: date_changed
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.DateChanged

  - dimension_group: date_copied_from_epic_dart
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.DateCopiedFromEpicDart

  - dimension_group: date_created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.DateCreated

  - dimension_group: dl_exp
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.DlExpDate

  - dimension: dlstate
    sql: ${TABLE}.DLState

  - dimension: drivers_license_number
    sql: ${TABLE}.DriversLicenseNumber

  - dimension: email_address
    sql: ${TABLE}.EmailAddress

  - dimension: email_marketing_opt_in
    type: int
    sql: ${TABLE}.Email_MarketingOptIn

  - dimension: email_operational_opt_in
    type: int
    sql: ${TABLE}.Email_OperationalOptIn

  - dimension: employer_name
    sql: ${TABLE}.EmployerName

  - dimension: employment_address
    sql: ${TABLE}.EmploymentAddress

  - dimension: employment_address2
    sql: ${TABLE}.EmploymentAddress2

  - dimension: employment_city
    sql: ${TABLE}.EmploymentCity

  - dimension: employment_months
    type: int
    sql: ${TABLE}.EmploymentMonths

  - dimension: employment_start_date
    sql: ${TABLE}.EmploymentStartDate

  - dimension: employment_state_id
    sql: ${TABLE}.EmploymentStateId

  - dimension: employment_years
    type: int
    sql: ${TABLE}.EmploymentYears

  - dimension: employment_zip
    sql: ${TABLE}.EmploymentZip

  - dimension: fax
    sql: ${TABLE}.Fax

  - dimension: first_name
    sql: ${TABLE}.FirstName

  - dimension: gender
    sql: ${TABLE}.Gender

  - dimension: home_phone
    sql: ${TABLE}.HomePhone

  - dimension: home_phone_do_not_call
    type: int
    sql: ${TABLE}.HomePhoneDoNotCall

  - dimension: home_rights
    sql: ${TABLE}.HomeRights

  - dimension: income_type
    sql: ${TABLE}.IncomeType

  - dimension: is_citizen
    type: int
    sql: ${TABLE}.IsCitizen

  - dimension: is_military
    type: int
    sql: ${TABLE}.IsMilitary

  - dimension: is_returning
    sql: ${TABLE}.IsReturning

  - dimension: language
    sql: ${TABLE}.Language

  - dimension: last_name
    sql: ${TABLE}.LastName

  - dimension: middle_name
    sql: ${TABLE}.MiddleName

  - dimension: number_current_residence_months
    type: int
    sql: ${TABLE}.NumberCurrentResidenceMonths

  - dimension: number_current_residence_years
    type: int
    sql: ${TABLE}.NumberCurrentResidenceYears

  - dimension: payroll_id
    type: int
    sql: ${TABLE}.PayrollId

  - dimension: payroll_method
    sql: ${TABLE}.PayrollMethod

  - dimension: position
    sql: ${TABLE}.Position

  - dimension: rent_or_own
    sql: ${TABLE}.RentOrOwn

  - dimension: sms_marketing_opt_in
    type: int
    sql: ${TABLE}.Sms_MarketingOptIn

  - dimension: sms_operational_opt_in
    type: int
    sql: ${TABLE}.Sms_OperationalOptIn

  - dimension: ssn
    sql: ${TABLE}.SSN

  - dimension: ssn4
    sql: ${TABLE}.SSN4

  - dimension: state_id
    sql: ${TABLE}.StateID

  - dimension: supervisor_name
    sql: ${TABLE}.SupervisorName

  - dimension: supervisor_phone
    sql: ${TABLE}.SupervisorPhone

  - dimension: supervisor_phone_ext
    sql: ${TABLE}.SupervisorPhoneExt

  - dimension: vw_client_id
    type: int
    sql: ${TABLE}.vw_Client_Id

  - dimension: work_fax
    sql: ${TABLE}.WorkFax

  - dimension: work_phone
    sql: ${TABLE}.WorkPhone

  - dimension: work_phone_do_not_call
    type: int
    sql: ${TABLE}.WorkPhoneDoNotCall

  - dimension: work_phone_ext
    sql: ${TABLE}.WorkPhoneExt

  - dimension: work_shift
    sql: ${TABLE}.WorkShift

  - dimension: zip
    sql: ${TABLE}.Zip

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - first_name
    - middle_name
    - last_name
    - bank_name
    - employer_name
    - supervisor_name

