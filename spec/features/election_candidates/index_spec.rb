require "rails_helper"

describe "Election Candidates Index", type: :feature do

  describe "when I visit \"/elections/:election_id/candidates\"" do
    
    # User Story 10, Parent Child Index Link
    it "then I see each Candidate that is associated with that Election with each Candidate's attributes" do
      mayor = Election.create!(name: "Denver Mayor", priority: 1, year: 2023, runoff: false)
      johnston = mayor.candidates.create!(name: "Mike Johnston", votes: 42273, incumbent: false)
      brough = mayor.candidates.create!(name: "Kelly Brough", votes: 34627, incumbent: false)
      calderon = mayor.candidates.create!(name: "Lisa Calderón", votes: 31493, incumbent: false)
    
      auditor = Election.create!(name: "Auditor", priority: 2, year: 2023, runoff: false)
      obrien = auditor.candidates.create!(name: "Timothy M. O'Brien", votes: 84856, incumbent: true)
    
      visit "/elections/#{mayor.id}/candidates"
    
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

