require "rails_helper"

RSpec.feature "Users can create new tickets" do

  let(:user) { FactoryGirl.create :user }

  before do
    login_as user
    project = FactoryGirl.create :project, name: "Internet Explorer"

    visit project_path project
    click_link "New Ticket"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Non-standard compliance"
    fill_in "Description", with: "My pages are ugly!"

    click_button "Create Ticket"

    expect(page).to have_content "Your ticket has been created."
    within("#ticket") do
      expect(page).to have_content "Author: #{user.email}"
    end
  end

  scenario "with invalid attributes" do
    click_button "Create Ticket"

    expect(page).to have_content "Your ticket has not been created."
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Description can't be blank"
  end

  scenario "with too short description" do
    fill_in "Name", with: "CSS has broken"
    fill_in "Description", with: "It sucks"
    click_button "Create Ticket"

    expect(page).to have_content "Your ticket has not been created."
    expect(page).to have_content "Description is too short"
  end
end
