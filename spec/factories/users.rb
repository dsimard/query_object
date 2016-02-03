FactoryGirl.define do
  factory :user do
    sequence(:gender) {|n| User.genders[[:m, :f][n%2]]}

    trait :m do
      gender User.genders[:m]
    end

    trait :f do
      gender User.genders[:f]
    end
  end
end
