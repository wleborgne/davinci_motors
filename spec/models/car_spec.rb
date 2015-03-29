require 'rails_helper'

RSpec.describe Car, type: :model do

  it 'is expected to be a Car' do
    car = FactoryGirl.create(:car)
    expect(car).to be_a(Car)
  end

  context 'is valid when it' do
    it 'has all four attributes' do
      car = FactoryGirl.create(:car)
      expect(car.valid?).to be_truthy
    end

    it 'has no price' do
      no_price_attributes = FactoryGirl.attributes_for(:car)
      no_price_attributes[:price] = nil
      car = Car.new(no_price_attributes)
      expect(car.valid?).to be_truthy
    end
  end

  context 'is invalid when it' do
    it 'has no make' do
      no_make = FactoryGirl.attributes_for(:car)
      no_make[:make] = nil
      car = Car.new(no_make)
      expect(car.valid?).to be_falsey
    end

    it 'has no model' do
      no_model = FactoryGirl.attributes_for(:car)
      no_model[:model] = nil
      car = Car.new(no_model)
      expect(car.valid?).to be_falsey
    end

    it 'has no year' do
      no_year = FactoryGirl.attributes_for(:car)
      no_year[:year] = nil
      car = Car.new(no_year)
      expect(car.valid?).to be_falsey
    end

    it 'has a non-numeric year' do
      bad_year = FactoryGirl.attributes_for(:car)
      bad_year[:year] = 'zero'
      car = Car.new(bad_year)
      expect(car.valid?).to be_falsey
    end

    it 'has a non-numeric price' do
      bad_price = FactoryGirl.attributes_for(:car)
      bad_price[:price] = 'zero'
      car = Car.new(bad_price)
      expect(car.valid?).to be_falsey
    end
  end
end
