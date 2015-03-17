require 'rails_helper'

feature 'Creating Cars' do
  let(:car1) { { make: 'Ford', model: 'Mustang',
                 year: '1967', price: '2300' } }
  let(:car2) { { make: 'Chevrolet', model: 'Corvette',
                 year: '1957', price: '15000' } }

  scenario 'can create a car' do
    visit '/'
    
    click_link 'New Car'
    
    fill_in 'Make', with: car1[:make]
    fill_in 'Model', with: car1[:model]
    fill_in 'Year', with: car1[:year]
    fill_in 'Price', with: car1[:price]
    

    click_button 'Create Car'
    
    expect(page).to have_content('1967 Ford Mustang created')
    expect(page).to have_content('$2,300.00')
  end
  
  scenario 'can create two cars' do
    # Create the first car
    # This first bit is redundant; need to find how to
    # abstract this process out of the test case
    visit '/'

    click_link 'New Car'

    fill_in 'Make', with: car1[:make]
    fill_in 'Model', with: car1[:model]
    fill_in 'Year', with: car1[:year]
    fill_in 'Price', with: car1[:price]


    click_button 'Create Car'

    expect(page).to have_content('1967 Ford Mustang created')
    expect(page).to have_content('$2,300.00')

    # Create second car; just copying from previous steps
    click_link 'New Car'

    fill_in 'Make', with: car2[:make]
    fill_in 'Model', with: car2[:model]
    fill_in 'Year', with: car2[:year]
    fill_in 'Price', with: car2[:price]


    click_button 'Create Car'

    expect(page).to have_content('1957 Chevrolet Corvette created')
    expect(page).to have_content('$15,000.00')

  end
end
