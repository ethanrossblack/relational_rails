require "rails_helper"

RSpec.describe "elections index page", type: :feature do
  describe "as a visitor" do
    describe "when I visit \"/elections\"" do
      it "then I see the name of each election record in the system" do
        mayor = Election.create(
          name: "Denver Mayor",
          priority: 1,
          year: 2023,
          runoff: false)
        council_d1 = Election.create(
          name: "City Council: District 1",
          priority: 3,
          year: 2023,
          runoff: false)

        visit "/elections"

        expect(page).to have_content(mayor.name)
        expect(page).to have_content(council_d1.name)
      end
    end
  end
end