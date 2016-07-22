FactoryGirl.define do
  factory :user do
    username 'homero'
    email    'homero@gmail.com'
    password 'test1234'
    first_name 'homero'
    second_name 'j'
    f_last_name 'simpson'
    s_last_name 'simpson'
    sex 'Male'
    birth_day Time.now - 18.years
    curp '123456789012345678'
    rfc '1234567890123'
    mobile '3313352255'
    phone '3313352255'
  end
end