FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "abc#{n}"}
    sequence(:email) { |n| "abc#{n}@example.com"}
  end

  factory :event_user do
  	before(:create){|event_user| event_user.user = FactoryGirl.build(:user)}
  	# association :user, :factory => :user
  	before(:create){|event_user| event_user.event = FactoryGirl.build_stubbed(:event)}
  end

  factory :event do
    sequence(:name) { |n| "abc#{n}"}
    sequence(:amount) { |n| 100+n}
  end

end