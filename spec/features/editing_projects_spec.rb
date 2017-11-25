require "rails_helper"

RSpec.feature "Users can edit projects" do

  before do
    project = FactoryGirl.create :project, name: "Sublime Text 3"

    visit "/"
    click_link "Sublime Text 3"
    click_link "Edit Project"
  end

  scenario "with the valid attributes" do
    fill_in "Name", with: "Sublime Text 4"
    click_button "Update Project"

    expect(page).to have_content "Your project has been updated."
    expect(page).to have_content "Sublime Text 4"
  end

  scenario "with invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Project"

    expect(page).to have_content "Your project has not been updated."
  end
end
