require 'rails_helper'

RSpec.describe Car, type: :model do
  it { should validate_presence_of(:make) }
  it { should validate_presence_of(:model) }
  it { should validate_presence_of(:year) }
  it { should validate_presence_of(:price) }
  it { should validate_numericality_of(:price) }
  it {
    should validate_numericality_of(:price).
        is_less_than(1_000_000).is_greater_than(0.00)
  }
  it {
    should validate_inclusion_of(:year).
        in_range(1769..Time.zone.now.year)
  }
  it { should belong_to(:user) }
  let(:valid_car) { { make: 'Ford', model: 'Mustang',
    year: '1967', price: '2300' } }

  it 'is expected to be a Car' do
    car = Car.new(valid_car)
    expect(car).to be_a(Car)
  end

  context 'is valid when it' do
    it 'has all four attributes' do
      car = Car.new(valid_car)
      expect(car.valid?).to be_truthy
    end

    it 'has no price' do
      no_price_attributes = Hash.new().merge(valid_car)
      no_price_attributes[:price] = nil
      car = Car.new(no_price_attributes)
      expect(car.valid?).to be_truthy
    end
  end

  context 'is invalid when it' do
    it 'has no make' do
      no_make = Hash.new().merge(valid_car)
      no_make[:make] = nil
      car = Car.new(no_make)
      expect(car.valid?).to be_falsey
    end

    it 'has no model' do
      no_model = Hash.new().merge(valid_car)
      no_model[:model] = nil
      car = Car.new(no_model)
      expect(car.valid?).to be_falsey
    end

    it 'has no year' do
      no_year = Hash.new().merge(valid_car)
      no_year[:year] = nil
      car = Car.new(no_year)
      expect(car.valid?).to be_falsey
    end

    it 'has a non-numeric year' do
      bad_year = Hash.new().merge(valid_car)
      bad_year[:year] = 'zero'
      car = Car.new(bad_year)
      expect(car.valid?).to be_falsey
    end

    it 'has a non-numeric price' do
      bad_price = Hash.new().merge(valid_car)
      bad_price[:price] = 'zero'
      car = Car.new(bad_price)
      expect(car.valid?).to be_falsey
    end
  end
end
