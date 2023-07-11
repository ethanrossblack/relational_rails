require "rails_helper"

RSpec.describe "elections index page", type: :feature do
  before :each do
    @council_d1 = Election.create!(name: "City Council: District 1", priority: 4, year: 2023, runoff: false)
    @auditor = Election.create!(name: "Auditor", priority: 2, year: 2023, runoff: false)
    @mayor = Election.create!(name: "Denver Mayor", priority: 1, year: 2023, runoff: false)
  end
  
  describe "as a visitor" do
    describe "when I visit \"/elections\"" do
      
      # User Story 1, Parent Index
      it "then I see the name of each election record in the system" do
        visit "/elections"

        expect(page).to have_content(@mayor.name)
        expect(page).to have_content(@council_d1.name)
      end

      # User Story 6, Parent Index sorted by Most Recently Created
      it "I see that Elections are ordered by most recently created first" do
        visit "/elections"

        expect(@mayor.name).to appear_before(@council_d1.name)
        expect(@mayor.name).to appear_before(@auditor.name)

        expect(@auditor.name).to appear_before(@council_d1.name)
      end

      # User Story 6, Parent Index sorted by Most Recently Created
      it "I see when an Election was created next to each Election" do
        visit "/elections"

        expect(page).to have_content(@mayor.created_at)
      end

      # User Story 17, Parent Update From Parent Index Page
      it "next to every election I see a link to update that election" do
        visit "/elections"

        expect(page).to have_link("Update #{@mayor.name}")

        click_on "Update #{@mayor.name}"

        expect(current_path).to eq("/elections/#{@mayor.id}/edit")
      end
    end
  end
end