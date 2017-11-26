require "rails_helper"

RSpec.feature "Users can only see the appropriate links" do
  let(:project) { FactoryGirl.create :project }
  let(:user) { FactoryGirl.create :user }
  let(:admin) { FactoryGirl.create :user, :admin }

  context "annonymous users" do
    scenario "can not see New Project links" do
      visit "/"
      expect(page).not_to have_link "New Project"
    end

    scenario "can not see Delete Project links" do
      visit project_path project
      expect(page).not_to have_link "Delete Project"
    end
  end

  context "logged in users" do
    before { login_as user }

    scenario "can not see New Project link" do
      visit "/"
      expect(page).not_to have_link "New Project"
    end

    scenario "can not see Delete Project links" do
      visit project_path project
      expect(page).not_to have_link "Delete Project"
    end
  end

  context "Admin users" do
    before { login_as admin }

    scenario "can see the New Project link" do
      visit "/"
      expect(page).to have_link "New Project"
    end

    scenario "can see Delete Project links" do
      visit project_path project
      expect(page).to have_link "Delete Project"
    end
  end
end
