require "rails_helper"

RSpec.feature "Users can create projects" do
  scenario "with valid attributes" do
    visit "/"

    click_link "New Project"
    fill_in "Name", with: "Sublime Text 3"
    fill_in "Description", with: "One of the best text editor."
    click_button "Create Project"

    expect(page).to have_content "Your project has been created."
  end
end
