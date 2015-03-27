require 'rails_helper'

feature 'User Authentication' do
  scenario 'allows a user to sign up' do
    visit '/'
    
    expect(page).to have_link('Signup')
    
    click_link('Signup')
    
    fill_in 'First Name', with: 'Bob'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'bob@smith.com'
    fill_in 'Password', with: 'sup3rs3krit'
    fill_in 'Password Confirmation', with: 'sup3rs3krit'
    click_button 'Signup'

    expect(page).to have_text('Thank you for signing up Bob')
    expect(page).to have_text('Signed in as bob@smith.com')
  end
end
