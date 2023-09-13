FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { person.first.kanji }
    last_name             { person.last.kanji }
    first_name_reading    { person.first.katakana }
    last_name_reading     { person.last.katakana }
    birthday              { Faker::Date.between(from: '1930-01-01', to: 5.years.ago) }
  end
end
