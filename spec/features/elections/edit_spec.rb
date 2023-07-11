require "rails_helper"

describe "Edit Election", type: :feature do
  
  before :each do
    @mayor = Election.create!(name: "Denver Mayor", priority: 1, year: 2023, runoff: false)
  end

  describe "As a visitor" do
    describe "When I visit an Election show page" do
      it "I can edit the Election by clicking on the \"Update Election\" link" do
        visit "/elections/#{@mayor.id}"

        expect(page).to_not have_content("Denver Mayor Runoff Extravaganza")
        expect(page).to_not have_content("YEAR: 2024")
        expect(page).to_not have_content("RUNOFF: true")
        expect(page).to_not have_content("PRIORITY: 2")
        
        click_link "Update Election"
        
        expect(current_path).to eq("/elections/#{@mayor.id}/edit")
        
        fill_in("Name", with: "Denver Mayor Runoff Extravaganza")
        select("2", from: "Priority")
        fill_in("Year", with: "2024")
        check("Runoff")
        
        click_on "Update Election"
        
        expect(current_path).to eq("/elections/#{@mayor.id}")
        
        expect(page).to have_content("Denver Mayor Runoff Extravaganza")
        expect(page).to have_content("YEAR: 2024")
        expect(page).to have_content("RUNOFF: true")
        expect(page).to have_content("PRIORITY: 2")
      end
    end
  end

end