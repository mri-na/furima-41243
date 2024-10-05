FactoryBot.define do
  factory :user do
    nickname { Faker::Internet.username }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { '山田' } # 日本語の全角文字を使用
    first_name { '太郎' } # 日本語の全角文字を使用
    last_name_kana { 'ヤマダ' } # カタカナの全角文字を使用
    first_name_kana { 'タロウ' } # カタカナの全角文字を使用
    birth_day { '2000-01-01' }
  end
end
