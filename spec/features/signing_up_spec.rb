require "rails_helper"

RSpec.feature "User can sign in" do
  scenario "when providing valid details" do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "phuong@gmail.com"
    fill_in "user_password", with: "phuongphuong"
    fill_in "Password confirmation", with: "phuongphuong"
    click_button "Sign up"

    expect(page).to have_content "You have signed up successfully."
  end
end
