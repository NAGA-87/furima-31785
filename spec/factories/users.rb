FactoryBot.define do
  factory :user do
    # nickname {Gimei::Nickname}
    nickname {"aaa"}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)+ "1a"}
    # password_confirmation {"test1234"}
    last_name {"苗字"}
    first_name {"名前"}
    last_name_kana {"アアア"}
    first_name_kana {"イイイ"}
    user_birthday {"2020-11-16"}
  end
end