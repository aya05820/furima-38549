FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname { Faker::Name.name}
    email { Faker::Internet.free_email }
    password { Faker::Internet.password }
    password_confirmation { password }
    first_name { person.first.kanji }
    last_name { person.last.kanji }
    first_name_kana { person.first.katakana }
    last_name_kana { person.last.katakana }
    birth_date { Faker::Date.backward }
  end
end

