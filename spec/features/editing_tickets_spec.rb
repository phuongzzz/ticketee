require "rails_helper"

RSpec.feature "Users can update tickets" do
  let(:project) { FactoryGirl.create :project }
  let(:ticket) { FactoryGirl.create :ticket, project: project }

  before do
    visit project_ticket_path project, ticket
    click_link "Edit Ticket"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Make it better"
    click_button "Update Ticket"

    expect(page).to have_content "Your ticket has been updated."

    within("#ticket h2") do
      expect(page).to have_content "Make it better"
      expect(page).not_to have_content ticket.name
    end
  end

  scenario "with invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Ticket"

    expect(page).to have_content "Your ticket has not been updated."
  end
end
