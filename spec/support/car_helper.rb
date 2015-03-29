module CarHelper
  def fill_create_form(car)
    click_link 'New Car'

    fill_in 'Make', with: car[:make]
    fill_in 'Model', with: car[:model]
    fill_in 'Year', with: car[:year]
    fill_in 'Price', with: car[:price]

    click_button 'Create Car'
  end

  def format_year_make_model(car)
    "#{car[:year]} #{car[:make]} #{car[:model]}"
  end

  def format_price(car)
    "#{ActiveSupport::NumberHelper.number_to_currency(car[:price])}"
  end
end
