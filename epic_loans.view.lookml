- view: epic_loans
  sql_table_name: EpicLoans
  fields:

  - dimension: affiliate_sub_id
    sql: ${TABLE}.AffiliateSubId

  - dimension: affliate_id
    sql: ${TABLE}.AffliateID

  - dimension: annual_percent_rate
    type: number
    sql: ${TABLE}.AnnualPercentRate

  - dimension: approved_amount
    sql: ${TABLE}.ApprovedAmount

  - dimension: approved_finance_fee
    sql: ${TABLE}.ApprovedFinanceFee

  - dimension: assigned_collection_agent
    sql: ${TABLE}.AssignedCollectionAgent

  - dimension: assigned_loan_manager
    sql: ${TABLE}.AssignedLoanManager

  - dimension_group: broken_promise
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.BrokenPromiseDate

  - dimension: calc_exclude_test
    type: int
    sql: ${TABLE}.Calc_ExcludeTest

  - dimension: calc_loan_status
    sql: ${TABLE}.Calc_LoanStatus

  - dimension: calc_origination_week
    type: int
    sql: ${TABLE}.Calc_OriginationWeek

  - dimension: collection_queue
    sql: ${TABLE}.CollectionQueue

  - dimension_group: collection_start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.CollectionStartDate

  - dimension: credit_ach_endpoint
    sql: ${TABLE}.CreditAchEndpoint

  - dimension: current_history_id
    type: int
    sql: ${TABLE}.CurrentHistoryId

  - dimension_group: date_application_received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.DateApplicationReceived

  - dimension_group: date_copied_from_epic_dart
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.DateCopiedFromEpicDart

  - dimension: debit_ach_endpoint
    sql: ${TABLE}.DebitAchEndpoint

  - dimension: debtor_client_id
    type: int
    sql: ${TABLE}.DebtorClientId

  - dimension: default_repayment
    sql: ${TABLE}.DefaultRepayment

  - dimension: display_number
    sql: ${TABLE}.DisplayNumber

  - dimension: due_date
    sql: ${TABLE}.DueDate

  - dimension: effective_date
    sql: ${TABLE}.EffectiveDate

  - dimension_group: follow_up_date
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.FollowUpDateTime

  - dimension: is_bounced
    type: int
    sql: ${TABLE}.IsBounced

  - dimension: is_esigned
    type: int
    sql: ${TABLE}.IsESigned

  - dimension: is_esigned20minutes
    type: int
    sql: ${TABLE}.IsESigned20minutes

  - dimension: is_express_loan
    type: int
    sql: ${TABLE}.IsExpressLoan

  - dimension: is_redirected
    type: int
    sql: ${TABLE}.IsRedirected

  - dimension: is_returning
    type: int
    sql: ${TABLE}.IsReturning

  - dimension: is_system_withdrawn
    type: int
    sql: ${TABLE}.IsSystemWithdrawn

  - dimension: is_wire_transfer
    type: int
    sql: ${TABLE}.IsWireTransfer

  - dimension: last_cl_verify_score
    type: int
    sql: ${TABLE}.LastClVerifyScore

  - dimension: last_clarity_decision
    sql: ${TABLE}.LastClarityDecision

  - dimension: last_datax_decision
    sql: ${TABLE}.LastDataxDecision

  - dimension: last_factor_trust_score
    type: int
    sql: ${TABLE}.LastFactorTrustScore

  - dimension: last_veritrac_decision
    sql: ${TABLE}.LastVeritracDecision

  - dimension: lead_acquired_ip
    sql: ${TABLE}.LeadAcquiredIP

  - dimension: lead_cost
    sql: ${TABLE}.LeadCost

  - dimension: lead_employment_type
    sql: ${TABLE}.LeadEmploymentType

  - dimension: lead_provider_name
    sql: ${TABLE}.LeadProviderName

  - dimension: loan_id
    type: int
    sql: ${TABLE}.LoanId

  - dimension: loan_status
    sql: ${TABLE}.LoanStatus

  - dimension: loan_type
    sql: ${TABLE}.LoanType

  - dimension: minutes_to_sign
    type: int
    sql: ${TABLE}.MinutesToSign

  - dimension: original_loan_id
    type: int
    sql: ${TABLE}.OriginalLoanId

  - dimension_group: origination
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.OriginationDate

  - dimension: other_offers
    type: int
    sql: ${TABLE}.OtherOffers

  - dimension: other_withdrawn_reason
    sql: ${TABLE}.OtherWithdrawnReason

  - dimension_group: paid_off
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.PaidOffDate

  - dimension: parent_loan_id
    type: int
    sql: ${TABLE}.ParentLoanId

  - dimension: program
    sql: ${TABLE}.Program

  - dimension: ref_url
    sql: ${TABLE}.RefUrl

  - dimension: reject_reason
    sql: ${TABLE}.RejectReason

  - dimension: renewal_extensions
    type: int
    sql: ${TABLE}.RenewalExtensions

  - dimension: requested_amount
    type: int
    sql: ${TABLE}.RequestedAmount

  - dimension: signed_date
    sql: ${TABLE}.SignedDate

  - dimension: signed_ip
    sql: ${TABLE}.SignedIP

  - dimension: signed_time
    sql: ${TABLE}.SignedTime

  - dimension: state
    sql: ${TABLE}.State

  - dimension: store_name
    sql: ${TABLE}.StoreName

  - dimension: void_reason
    sql: ${TABLE}.VoidReason

  - dimension: vw_loans_id
    type: int
    sql: ${TABLE}.vw_Loans_Id

  - dimension: withdrawn_reason
    sql: ${TABLE}.WithdrawnReason

  - measure: count
    type: count
    drill_fields: [store_name, lead_provider_name]
    
  - measure: rejected_count
    type: count
    sql: ${reject_reason}
    
  - measure: m_approved_amount
    type: sum
    sql: ${TABLE}.ApprovedAmount

  - measure: m_requested_amount
    type: sum
    sql: ${TABLE}.RequestedAmount
    
  - measure: average_approval_amount
    type: number
    sql: ${m_approved_amount}/${count}
    decimals: 2