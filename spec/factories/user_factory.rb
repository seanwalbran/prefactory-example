FactoryGirl.define do
  sequence :name do |n|
    "Jane Doe-#{n}"
  end

  factory :user do
    name do
      FactoryGirl.generate(:name).tap do |result|
        # inject artificial latency to demonstrate performance implications
        puts "\nSleeping during create name: #{result}"
        sleep 1.0
      end
    end
  end
end
