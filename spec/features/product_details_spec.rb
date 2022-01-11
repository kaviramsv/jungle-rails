require 'rails_helper'
RSpec.feature "Visitor can navigate from home page to product page by clicking on a product", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see details of one product " do
    # ACT
    visit root_path   
    click_link("Details", match: :first)
    # DEBUG / VERIFY
    save_screenshot
    puts page.html 
    expect(page).to have_css 'section.products-show',count:1
  end

end 