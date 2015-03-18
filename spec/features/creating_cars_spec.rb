require 'rails_helper'

feature 'Creating Cars' do
  let(:car1) { { make: 'Ford', model: 'Mustang',
                 year: '1967', price: '2300' } }
  let(:car2) { { make: 'Chevrolet', model: 'Corvette',
                 year: '1957', price: '15000' } }

  def fill_create_form(car)
    click_link 'New Car'

    fill_in 'Make', with: car[:make]
    fill_in 'Model', with: car[:model]
    fill_in 'Year', with: car[:year]
    fill_in 'Price', with: car[:price]
    
    click_button 'Create Car'
  end

  scenario 'can create a car' do
    visit '/'
    
    fill_create_form(car1)
    
    expect(page).to have_content('1967 Ford Mustang created')
    expect(page).to have_content('$2,300.00')
  end
  
  scenario 'can create two cars' do
    visit '/'

    # Create the first car

    fill_create_form(car1)
    
    expect(page).to have_content('1967 Ford Mustang created')
    expect(page).to have_content('$2,300.00')

    # Create second car
    fill_create_form(car2)
    
    expect(page).to have_content('1957 Chevrolet Corvette created')
    expect(page).to have_content('$15,000.00')
  end
end
