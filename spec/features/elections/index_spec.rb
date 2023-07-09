require "rails_helper"

RSpec.describe "elections index page", type: :feature do
  describe "as a visitor" do
    describe "when I visit \"/elections\"" do
      it "then I see the name of each election record in the system" do
        mayor = Election.create!(
          name: "Denver Mayor",
          priority: 1,
          year: 2023,
          runoff: false)
        council_d1 = Election.create!(
          name: "City Council: District 1",
          priority: 3,
          year: 2023,
          runoff: false)

        visit "/elections"

        expect(page).to have_content(mayor.name)
        expect(page).to have_content(council_d1.name)
      end

      # User Story 6
      it "I see that Elections are ordered by most recently created first" do
        council_d1 = Election.create!(name: "City Council: District 1", priority: 4, year: 2023, runoff: false)
        sleep 0.5
        auditor = Election.create!(name: "Auditor", priority: 2, year: 2023, runoff: false)
        sleep 0.5
        mayor = Election.create!(name: "Denver Mayor", priority: 1, year: 2023, runoff: false)

        visit "/elections"

        save_and_open_page

        expect(mayor.name).to appear_before(council_d1.name)
        expect(mayor.name).to appear_before(auditor.name)

        expect(auditor.name).to appear_before(council_d1.name)
      end

      # User Story 6
      it "I see when an Election was created next to the Election" do
        mayor = Election.create!(name: "Denver Mayor", priority: 1, year: 2023, runoff: false)

        visit "/elections"

        save_and_open_page

        expect(page).to have_content(mayor.created_at)
      end
    end
  end
end