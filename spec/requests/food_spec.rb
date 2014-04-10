require 'spec_helper'

describe "Food listing" do

  subject { page }
  before do
    visit root_url
    click_link "Food"
  end

  it { should have_title(venue.name) }
end
