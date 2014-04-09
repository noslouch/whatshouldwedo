require 'spec_helper'

feature "Home page" do

  scenario "should have the cotent 'What's Next'" do
    visit root_url
    expect(page).to have_content("What's Next?")
  end
end
