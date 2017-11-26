require "rails_helper"

RSpec.feature "Admin can create new user" do
  let(:admin) { FactoryGirl.create :user, :admin }

  before do
    login_as admin
    visit "/"
    click_link "Admin"
    click_link "Users"
    click_link "New User"
  end

  scenario "with valid credentials" do
    fill_in "Email", with: "newbie@ticketee.com"
    fill_in "Password", with: "phuongphuong"
    click_button "Create User"
    expect(page).to have_content "User has been created."
  end

  scenario "when the new user is an admin" do
    fill_in "Email", with: "myadmin@ticketee.com"
    fill_in "Password", with: "phuongphuong"
    check "Is an admin?"
    click_button "Create User"

    expect(page).to have_content "User has been created."
    expect(page).to have_content "myadmin@ticketee.com (Admin)"
  end
end
