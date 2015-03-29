FactoryGirl.define do
  factory :car do
    make { Faker::Company.name }
    model { Faker::Team.creature.singularize.titleize }
    year { rand(1940..2015)}
    price { rand(0..15000) }
    # make "MyString"
    # model "MyString"
    # year 1
    # price "9.99"
  end

end
