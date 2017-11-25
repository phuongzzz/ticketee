require "rails_helper"

RSpec.feature "Users can delete tickets" do
  let(:author) { FactoryGirl.create :user }
  let(:project) { FactoryGirl.create :project }
  let(:ticket) { FactoryGirl.create :ticket, project: project, author: author }

  scenario "successfully" do
    visit project_ticket_path project, ticket
    click_link "Delete Ticket"

    expect(page).to have_content "Your ticket has been deleted."
    expect(page.current_url).to eq project_url project
  end
end
