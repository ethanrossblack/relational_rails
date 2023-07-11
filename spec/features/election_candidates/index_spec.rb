require "rails_helper"

describe "Election Candidates Index", type: :feature do
  before :each do
    @mayor = Election.create!(name: "Denver Mayor", priority: 1, year: 2023, runoff: false)
    @auditor = Election.create!(name: "Auditor", priority: 2, year: 2023, runoff: false)
    @clerk = Election.create!(name: "Clerk and Recorder", priority: 2, year: 2023, runoff: false)

    @mayor_1 = @mayor.candidates.create!(name: "Mike Johnston", votes: 42273, incumbent: false)
    @mayor_2 = @mayor.candidates.create!(name: "Kelly Brough", votes: 34627, incumbent: false)
    @mayor_3 = @mayor.candidates.create!(name: "Lisa Calderón", votes: 31493, incumbent: false)
    @mayor_4 = @mayor.candidates.create!(name: "Andy Rougeot", votes: 19927, incumbent: false)
    @mayor_5 = @mayor.candidates.create!(name: "Leslie Herod", votes: 18506, incumbent: false)

    @auditor_1 = @auditor.candidates.create!(name: "Timothy M. O'Brien", votes: 84856, incumbent: true)
    @auditor_2 = @auditor.candidates.create!(name: "Erik J. Clarke", votes: 58657, incumbent: false)

    @clerk_1 = @clerk.candidates.create!(name: "Paul D. López", votes: 128772, incumbent: true)
  end

  describe "when I visit \"/elections/:election_id/candidates\"" do
    
    # User Story 10, Parent Child Index Link
    it "then I see each Candidate that is associated with that Election with each Candidate's attributes" do
      visit "/elections/#{@mayor.id}/candidates"
    
      expect(page).to have_content(@mayor_1.name)
      expect(page).to have_content(@mayor_1.votes)
      expect(page).to have_content(@mayor_1.incumbent)
      expect(page).to have_content(@mayor_1.election_id)
      expect(page).to have_content(@mayor_1.created_at)
      expect(page).to have_content(@mayor_1.updated_at)
      
      expect(page).to have_content(@mayor_2.name)
      expect(page).to have_content(@mayor_2.votes)
      expect(page).to have_content(@mayor_2.incumbent)
      expect(page).to have_content(@mayor_2.election_id)
      expect(page).to have_content(@mayor_2.created_at)
      expect(page).to have_content(@mayor_2.updated_at)

      expect(page).to have_content(@mayor_3.name)
      expect(page).to have_content(@mayor_3.votes)
      expect(page).to have_content(@mayor_3.incumbent)
      expect(page).to have_content(@mayor_3.election_id)
      expect(page).to have_content(@mayor_3.created_at)
      expect(page).to have_content(@mayor_3.updated_at)

      expect(page).to_not have_content(@auditor_1.name)
      expect(page).to_not have_content("ELECTION ID: #{@auditor_1.election_id}")
    end

    # User Story 16, Sort Parent's Children in Alphabetical Order by name
    it "then I can click a link to sort the Election's Candidates in alphabetical order by name" do
      mike = @mayor_1
      kelly = @mayor_2
      lisa = @mayor_3
      andy = @mayor_4
      leslie = @mayor_5
      
      visit "/elections/#{@mayor.id}/candidates"

      expect(page).to have_link("Sort By Name")

      click_link("Sort By Name")
      
      expect(andy.name).to appear_before(mike.name)
    end

    # User Story 18, Child Update From Childs Index Page 
    it "I see a link next to each Candidate to edit that Candidate" do
      visit "/elections/#{@mayor.id}/candidates"

      expect(page).to have_link("Update #{@mayor_1.name}")

      click_link "Update #{@mayor_1.name}"

      expect(current_path).to eq("/candidates/#{@mayor_1.id}/edit")
    end
  end
end

