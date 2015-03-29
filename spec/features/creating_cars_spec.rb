require 'rails_helper'
require_relative '../support/car_helper'


feature 'Creating Cars' do
  include CarHelper
  
  let(:car1) { FactoryGirl.attributes_for(:car) }
  let(:car2) { FactoryGirl.attributes_for(:car) }

  scenario 'can create a car' do
    visit '/'
    
    fill_create_form(car1)
    
    expect(page).to have_content("#{format_year_make_model(car1)} created")
    expect(page).to have_content("#{format_price(car1)}")
  end
  
  scenario 'can create two cars' do
    visit '/'

    # Create the first car

    fill_create_form(car1)
    
    expect(page).to have_content("#{format_year_make_model(car1)} created")
    expect(page).to have_content("#{format_price(car1)}")

    # Create second car
    fill_create_form(car2)
    
    expect(page).to have_content("#{format_year_make_model(car2)} created")
    expect(page).to have_content("#{format_price(car2)}")
  end
  
  scenario 'can create a car with no price' do
    visit '/'
    
    # Create attributes for a car with no price
    no_price = Hash.new().merge(car1)
    no_price[:price] = nil
    
    fill_create_form(no_price)

    expect(page).to have_content("#{format_year_make_model(car1)} created")
  end
end
