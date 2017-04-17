require 'rails_helper'

describe "User visits the page" do
  scenario "user only sees the headers" do

    visit "/"

    expect(page).to have_content("The Hot Links")
  end

  scenario "users sees a single link" do
    link = Link.create(url: "https://www.google.com")

    visit '/'

    expect(page).to have_content("The Hot Links")
    expect(page).to have_content(link.url)
    expect(page).to have_content(link.read_count)
  end

  scenario "users sees a ten links" do
    link_1 = Link.create(url: "https://www.google1.com")
    link_2 = Link.create(url: "https://www.google2.com")
    link_3 = Link.create(url: "https://www.google3.com")
    link_4 = Link.create(url: "https://www.google4.com")
    link_5 = Link.create(url: "https://www.google5.com")
    link_6 = Link.create(url: "https://www.google6.com")
    link_7 = Link.create(url: "https://www.google7.com")
    link_8 = Link.create(url: "https://www.google8.com")
    link_9 = Link.create(url: "https://www.google9.com")
    link_10 = Link.create(url: "https://www.google10.com")

    visit '/'

    expect(page).to have_content("The Hot Links")
    expect(page).to have_content(link_1.url)
    expect(page).to have_content(link_5.url)
    expect(page).to have_content(link_9.url)
    expect(page).to have_content(link_2.read_count)
    expect(page).to have_content(link_6.read_count)
    expect(page).to have_content(link_8.read_count)
  end

  scenario "users sees a ten links despit there being more than ten links" do
    link_1 = Link.create(url: "https://www.google1.com")
    link_2 = Link.create(url: "https://www.google2.com")
    link_3 = Link.create(url: "https://www.google3.com")
    link_4 = Link.create(url: "https://www.google4.com")
    link_5 = Link.create(url: "https://www.google5.com")
    link_6 = Link.create(url: "https://www.google6.com")
    link_7 = Link.create(url: "https://www.google7.com")
    link_8 = Link.create(url: "https://www.google8.com")
    link_9 = Link.create(url: "https://www.google9.com")
    link_10 = Link.create(url: "https://www.google10.com")
    link_11 = Link.create(url: "https://www.google11.com")
    link_12 = Link.create(url: "https://www.google12.com")
    link_13 = Link.create(url: "https://www.google13.com")

    visit '/'

    expect(page).to have_content("The Hot Links")
    expect(page).to have_content(link_1.url)
    expect(page).to have_content(link_5.url)
    expect(page).to have_content(link_9.url)
    expect(page).to have_content(link_2.read_count)
    expect(page).to have_content(link_6.read_count)
    expect(page).to have_content(link_8.read_count)
    expect(page).to have_selector('tr', count: 10)
  end
end
