require "rails_helper"

# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a POST request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

describe "New Election", type: :feature do
  
  before :each do
    @council_d1 = Election.create!(name: "City Council: District 1", priority: 4, year: 2023, runoff: false)
    @auditor = Election.create!(name: "Auditor", priority: 2, year: 2023, runoff: false)
    @mayor = Election.create!(name: "Denver Mayor", priority: 1, year: 2023, runoff: false)
  end

  describe "As a visitor" do
    # User Story 11, Parent Creation
    describe "When I visit the \"New Election\" form by clicking a link on the Elections index page" do
      it "I can create a new Election" do
        visit "/elections"

        expect(page).to_not have_content("City Council: District 4")

        expect(page).to have_link("New Election")

        click_link("New Election")
          
        expect(current_path).to eq("/elections/new")
        
        fill_in("Name", with: "City Council: District 4")
        select("4", from: "Priority")
        fill_in("Year", with: "2023")
        check("Runoff")

        click_on "Create Election"
        
        expect(current_path).to eq("/elections")
        expect(page).to have_content ("City Council: District 4")
      end
    end
  end
end