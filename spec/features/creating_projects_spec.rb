require "rails_helper"

RSpec.feature "Users can create projects" do

  before do
    visit "/"

    click_link "New Project"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Sublime Text 3"
    fill_in "Description", with: "One of the best text editor."
    click_button "Create Project"

    expect(page).to have_content "Your project has been created."

    project = Project.find_by name: "Sublime Text 3"
    expect(page.current_url).to eq project_url project

    title = "Sublime Text 3 - Projects - Ticketee"
    expect(page).to have_title title
  end

  scenario "when providing invalid attributes" do
    click_button "Create Project"

    expect(page).to have_content "Your project has not been created."
    expect(page).to have_content "Name can't be blank"
  end
end
