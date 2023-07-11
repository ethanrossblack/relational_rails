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

      describe "When I click \"Update Candidate\"," do
        it "I am taken to \"/candidates/:id/edit\" where I see a form to edit the candidate's attributes" do
          visit "/candidates/#{@johnston.id}"

          click_link("Update Candidate")

          expect(current_path).to eq("/candidates/#{@johnston.id}/edit")
          
          expect(page).to have_field("Name", with: "Mike Johnston")
          expect(page).to have_field("Votes", with: 42273)
          expect(page).to have_unchecked_field("Incumbent")
          expect(page).to have_button("Update Candidate")
        end
        
        describe "When I click the button to submit the form \"Update Candidate\"," do
          it "then a \`PATCH\` request is sent to \"/candidates/:id\", the candidate's data is updated, and I am redirected to the Candidate Show page where I see the Candidate's updated information" do
            visit "/candidates/#{@johnston.id}/edit"
            
            fill_in("Name", with: "Shmike Shmohnston")
            fill_in("Votes", with: 42042)
            check("Incumbent")
            
            click_on "Update Candidate"
            
            expect(current_path).to eq("/candidates/#{@johnston.id}")
            
            @johnston.reload

            expect(@johnston.name).to eq("Shmike Shmohnston")
            expect(@johnston.votes).to eq(42042)
            expect(@johnston.incumbent).to be true

            expect(page).to have_content(@johnston.name)
            expect(page).to have_content("VOTES: #{@johnston.votes}")
            expect(page).to have_content("INCUMBENT: #{@johnston.incumbent}")
          end
        end
      end
    end
  end
end