FactoryBot.define do
  factory :user do
    transient do
      user_password { "s3cret" }
    end

    email { Faker::Internet.email }
    password { user_password }
    password_confirmation { user_password }
    active { true }
  end

  factory :long, class: "User" do
    email { "long@example.com" }
    password { "s3cret" }
    password_confirmation { "s3cret" }
  end

  factory :new_user, class: 'User' do
    email { Faker::Internet.email }
    password { "s3cret" }
    password_confirmation { "s3cret" }
  end
end
