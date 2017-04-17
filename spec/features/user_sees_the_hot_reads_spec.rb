require 'rails_helper'

describe "User visits the page" do
  scenario "user only sees the headers" do

    visit "/"

    expect(page).to have_content("The Hot Links")
  end
end
