FactoryGirl.define do
  factory :application do
    loan_title 'title'
    loan_detail 'detail'
    loan_destination 'destination'
    funding_days 'funding_days'
    has_credit_card true
    has_insurance true
    has_car true
    other_income 'other_income'
    education 'education'
    pay_job 'pay_job'
    year_job 'year_job'
    company_job 'company_job'

    factory :complete_application do
      after(:build) do |application|
        application.expenses << build_list(:expense, 1, application: application)
        application.references << build_list(:reference, 3, application: application)
      end
    end
  end
end