# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email, ActiveRecord::Base.connection.table_exists?('users') ? User.next_id : 0) {|n| "person_#{n}@example.com" }
    password "strong passwords defeat lobsters covering wealth"
    after(:build) do |user|
      user.skip_confirmation!
    end
  end

  factory :admin_user, :parent => :user do
    after(:build) do |user|
      user.admin = true
      user.save
      # user.add_role :admin
    end
  end

  factory :activist_user, :parent => :user do
    after(:build) do |user|
      user.admin = true
      user.save
      # user.add_role :activist
    end
  end

end
