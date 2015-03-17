require 'rails_helper'

feature 'Creating Cars' do
  let(:car1) { { make: 'Ford', model: 'Mustang',
                 year: '1967', price: '2300' } }
  scenario 'can create a car' do
    visit '/'
    
    click_link 'New Car'
    
    fill_in 'Make', with: car1[:make]
    fill_in 'Model', with: car1[:model]
    fill_in 'Year', with: car1[:year]
    fill_in 'Price', with: car1[:price]
    

    click_button 'Create Car'
    
    expect(page).to have_content('1967 Ford Mustang created')
    # save_and_open_page
    expect(page).to have_content('$2,300.00')
  end
end
