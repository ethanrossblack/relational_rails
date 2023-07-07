require "rails_helper"

RSpec.describe "elections show page", type: :feature do
  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes
  # (data from each column that is on the parent table)

  describe "as a visitor" do
    describe "when I visit \"/elections/:id\"" do
      it "then I see the election with that id including the election's attributes" do
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

        visit "/elections/#{mayor.id}"

        expect(page).to have_content(mayor.name)
        expect(page).to have_content(mayor.priority)
        expect(page).to have_content(mayor.year)
        expect(page).to have_content(mayor.runoff)
      end
    end
  end
end