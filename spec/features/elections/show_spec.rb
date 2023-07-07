require "rails_helper"

RSpec.describe "elections show page", type: :feature do
  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes
  # (data from each column that is on the parent table)

  describe "as a visitor" do
    describe "when I visit \"/elections/:id\"" do
      it "then I see the election with that id including the election's attributes" do
        mayor = Election.create!(name: "Denver Mayor", priority: 1, year: 2023, runoff: false)
        council_d1 = Election.create!(name: "City Council: District 1", priority: 4, year: 2023, runoff: false)

        visit "/elections/#{mayor.id}"

        expect(page).to have_content(mayor.name)
        expect(page).to have_content(mayor.priority)
        expect(page).to have_content(mayor.year)
        expect(page).to have_content(mayor.runoff)
      end
    end
  end

  describe "as a visitor" do
    describe "when I visit \"/elections/:election_id/candidates\"" do
      it "then I see each Candidate that is associated with that Election with each Candidate's attributes" do
        mayor = Election.create!(name: "Denver Mayor", priority: 1, year: 2023, runoff: false)
        johnston = mayor.candidates.create!(name: "Mike Johnston", votes: 42273, incumbent: false)
        brough = mayor.candidates.create!(name: "Kelly Brough", votes: 34627, incumbent: false)
        calderon = mayor.candidates.create!(name: "Lisa Calderón", votes: 31493, incumbent: false)

        auditor = Election.create!(name: "Auditor", priority: 2, year: 2023, runoff: false)
        obrien = auditor.candidates.create!(name: "Timothy M. O'Brien", votes: 84856, incumbent: true)

        visit "/elections/#{mayor.id}/candidates"

        save_and_open_page

        expect(page).to have_content(johnston.name)
        expect(page).to have_content(johnston.votes)
        expect(page).to have_content(johnston.incumbent)
        expect(page).to have_content(johnston.election_id)
        expect(page).to have_content(johnston.created_at)
        expect(page).to have_content(johnston.updated_at)
        
        expect(page).to have_content(brough.name)
        expect(page).to have_content(brough.votes)
        expect(page).to have_content(brough.incumbent)
        expect(page).to have_content(brough.election_id)
        expect(page).to have_content(brough.created_at)
        expect(page).to have_content(brough.updated_at)
        
        expect(page).to have_content(calderon.name)
        expect(page).to have_content(calderon.votes)
        expect(page).to have_content(calderon.incumbent)
        expect(page).to have_content(calderon.election_id)
        expect(page).to have_content(calderon.created_at)
        expect(page).to have_content(calderon.updated_at)
        
        expect(page).to_not have_content(obrien.name)
        expect(page).to_not have_content("ELECTION ID: #{obrien.election_id}")
      end
    end
  end

end