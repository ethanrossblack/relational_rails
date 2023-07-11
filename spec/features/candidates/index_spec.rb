require "rails_helper"

RSpec.describe "candidates index page", type: :feature do
  # As a visitor
  # When I visit '/child_table_name'
  # Then I see each Child in the system including the Child's attributes
  # (data from each column that is on the child table)
  describe "as a visitor" do

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

    describe "when I visit \"candidates\"" do
      xit "then I see each Candidate in the system including the Candidate's attributes" do
        visit "/candidates"
        
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
      end


      # User Story 15, Child Index Only Shows True Records
      it "then I only see records where Incumbent is true" do
        visit "/candidates"

        expect(page).to have_content(@auditor_1.name)
        expect(page).to have_content(@auditor_1.votes)
        expect(page).to have_content(@auditor_1.incumbent)
        expect(page).to have_content(@auditor_1.election_id)
        expect(page).to have_content(@auditor_1.created_at)
 
        expect(page).to have_content(@clerk_1.name)
        expect(page).to have_content(@clerk_1.votes)
        expect(page).to have_content(@clerk_1.incumbent)
        expect(page).to have_content(@clerk_1.election_id)
        expect(page).to have_content(@clerk_1.created_at)

        expect(page).to_not have_content(@mayor_1.name)
      end
    end
  end
end