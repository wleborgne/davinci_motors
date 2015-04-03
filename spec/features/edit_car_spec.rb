require 'rails_helper'

feature 'Edit cars' do
  let(:car1) { { make: 'Ford', model: 'Mustang',
    year: '1967', price: '2300' } }

  def fill_create_form(car)
    click_link 'New Car'

    fill_in 'Make', with: car[:make]
    fill_in 'Model', with: car[:model]
    fill_in 'Year', with: car[:year]
    fill_in 'Price', with: car[:price]
    
    click_button 'Create Car'
  end

  it 'allows cars to be edited' do
    visit '/'
    # Create a car
    fill_create_form(car1)
    # Click edit link
    click_link 'Edit'
    # Edit the price and click update button
    fill_in 'Price', with: '2500'
    click_button 'Update Car'
    # Verify new price appears on page
    expect(page).to have_content('$2,500.00')
  end
  
  # it 'allows price to be added to car with no price' do
  #   visit '/'
  #   no_price = Hash.new().merge(car1)
  #   no_price[:price] = nil
  #   fill_create_form(no_price)
  #   click_link 'Edit'
  #   fill_in 'Price', with: '3000'
  #   click_button 'Update Car'
  #   expect(page).to have_content('$3,000.00')
  # end
end
