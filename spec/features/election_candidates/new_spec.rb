require "rails_helper"

# User Story 13, Parent Child Creation
describe "Parent Child Creation", type: :feature do

  before :each do
    @mayor = Election.create!(name: "Denver Mayor", priority: 1, year: 2023, runoff: false)

    @mayor_1 = @mayor.candidates.create!(name: "Mike Johnston", votes: 42273, incumbent: false)
  end

  describe "As a visitor" do
    describe "When I visit a Election Candidate Index page" do
      it "then I see a link to add a new Candidate for that Election called, \"Create Candidate\"" do
        visit "/elections/#{@mayor.id}/candidates"
        
        expect(page).to have_link("Create Candidate")
      end
      
      describe "when I click \"Create Candidate\"," do
        it "I am taken to \"/elections/:election_id/candidates/new\" where I see a form to add a new Candidate" do
          visit "/elections/#{@mayor.id}/candidates"
          
          click_link("Create Candidate")

          expect(current_path).to eq("/elections/#{@mayor.id}/candidates/new")

          expect(page).to have_field("Name")
          expect(page).to have_field("Votes")
          expect(page).to have_field("Incumbent")
          expect(page).to have_button("Create Candidate")
        end

        describe "When I fill in the form with the Candidate's attributes and click the button \"Create Candidate\"," do
          it "then a \"POST\" request is sent to \"/elections/:election_id/candidates\", a new Candidate is created for that Election, and I am redirected to the Election Candidates Index page where I can see the new Candidate listed" do
            visit "/elections/#{@mayor.id}/candidates/new"
            
            fill_in("Name", with: "Chris Hansen")
            fill_in("Votes", with: 8309)
            
            click_button "Create Candidate"

            expect(current_path).to eq("/elections/#{@mayor.id}/candidates")

            hansen = Candidate.last

            expect(hansen.name).to eq("Chris Hansen")
            expect(hansen.votes).to eq(8309)
            expect(hansen.incumbent).to be false
            expect(hansen.election_id).to eq(@mayor.id)

            expect(page).to have_content(hansen.name)
            expect(page).to have_content("VOTES: #{hansen.votes}")
          end
        end
      end
    end
  end
end