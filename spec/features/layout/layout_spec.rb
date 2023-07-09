require "rails_helper"

describe "application layout", type: :feature do
  describe "as a visitor" do
    # User Story 8
    describe "when I visit any page on the site" do
      it "then I see a link on the top of the page that takes me to the Candidates index" do
        mayor = Election.create!(name: "Denver Mayor", priority: 1, year: 2023, runoff: false)
        mayor.candidates.create!(name: "Mike Johnston", votes: 42273, incumbent: false)
        mayor.candidates.create!(name: "Kelly Brough", votes: 34627, incumbent: false)

        visit "/elections"

        save_and_open_page

        expect(page).to have_link("Candidates")

        click_link("Candidates")

        expect(current_path).to eq("/candidates")

        visit "/elections/#{mayor.id}/candidates"

        expect(page).to have_link("Candidates")

        click_link("Candidates")

        expect(current_path).to eq("/candidates")
      end
    end
  end
end