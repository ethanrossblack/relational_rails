require "rails_helper"

# User Story 14, Child Update
describe "Candidate Update", type: :feature do

  before :each do
    @mayor = Election.create!(name: "Denver Mayor", priority: 1, year: 2023, runoff: false)
    @johnston = @mayor.candidates.create!(name: "Mike Johnston", votes: 42273, incumbent: false)
  end

  describe "As a visitor" do
    describe "When I visit a Candidate Show page" do
      it "Then I see a link to update that Candidate \"Update Candidate\"" do
        visit "/candidates/#{@johnston.id}"

        expect(page).to have_link("Update Candidate")
      end

      describe "When I click the link" do
        it "I am taken to \"/candidates/:id/edit\" where I see a form to edit the candidate's attributes" do
          visit "/candidates/#{@johnston.id}"

          click_link("Update Candidate")

          expect(current_path).to eq("/candidates/#{@johnston.id}/edit")

          expect(page).to have_field("Name", with: "Mike Johnston")
          expect(page).to have_field("Votes", with: 42273)
          expect(page).to have_unchecked_field("Incumbent")
          expect(page).to have_button("Update Candidate")
        end
      end
    end
  end
end