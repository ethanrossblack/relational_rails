require "rails_helper"

RSpec.describe "elections show page", type: :feature do
  describe "as a visitor" do
    describe "when I visit \"/elections/:id\"," do
      # User Story 2, Parent Show
      it "then I see the election with that id including the election's attributes" do
        mayor = Election.create!(name: "Denver Mayor", priority: 1, year: 2023, runoff: false)
        council_d1 = Election.create!(name: "City Council: District 1", priority: 4, year: 2023, runoff: false)

        visit "/elections/#{mayor.id}"

        expect(page).to have_content(mayor.name)
        expect(page).to have_content(mayor.priority)
        expect(page).to have_content(mayor.year)
        expect(page).to have_content(mayor.runoff)

        expect(page).to_not have_content(council_d1.name)
      end

      # User Story 7, Parent Child Count
      it "I see a count of the number of Candidates associated with this Election" do
        mayor = Election.create!(name: "Denver Mayor", priority: 1, year: 2023, runoff: false)
        auditor = Election.create!(name: "Auditor", priority: 2, year: 2023, runoff: false)

        mayor.candidates.create!(name: "Mike Johnston", votes: 42273, incumbent: false)
        mayor.candidates.create!(name: "Kelly Brough", votes: 34627, incumbent: false)
        mayor.candidates.create!(name: "Lisa Calderón", votes: 31493, incumbent: false)
        mayor.candidates.create!(name: "Andy Rougeot", votes: 19927, incumbent: false)
        mayor.candidates.create!(name: "Leslie Herod", votes: 18506, incumbent: false)

        auditor.candidates.create!(name: "Timothy M. O'Brien", votes: 84856, incumbent: true)
        auditor.candidates.create!(name: "Erik J. Clarke", votes: 58657, incumbent: false)

        visit "/elections/#{mayor.id}"

        save_and_open_page

        expect(page).to have_content("CANDIDATES: 5")
        
        visit "/elections/#{auditor.id}"

        save_and_open_page

        expect(page).to have_content("CANDIDATES: 2")
      end
      
      # User Story 10, Parent Child Index Link
      it "then I see a link to take me to that Election's candidates page" do
        mayor = Election.create!(name: "Denver Mayor", priority: 1, year: 2023, runoff: false)
        johnston = mayor.candidates.create!(name: "Mike Johnston", votes: 42273, incumbent: false)
        brough = mayor.candidates.create!(name: "Kelly Brough", votes: 34627, incumbent: false)
        calderon = mayor.candidates.create!(name: "Lisa Calderón", votes: 31493, incumbent: false)

        visit "/elections/#{mayor.id}"

        expect(page).to have_link("View Candidates")

        click_link("View Candidates")

        expect(current_path).to eq("/elections/#{mayor.id}/candidates")
      end
    end

  end

end