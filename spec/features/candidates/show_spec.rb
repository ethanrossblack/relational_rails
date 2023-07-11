require "rails_helper"


# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes
# (data from each column that is on the child table)

describe "candidates show page", type: :feature do
  describe "as a visitor" do
    describe "when I visit \"/candidates/:id\"" do
      # User Story 3, Child Index
      xit "then I see the candidate with that id including the candidate's attributes" do
        mayor = Election.create!(name: "Denver Mayor", priority: 1, year: 2023, runoff: false)
        candidate = mayor.candidates.create!(name: "Mike Johnston", votes: 42273, incumbent: false)

        visit "/candidates/#{candidate.id}"

        expect(page).to have_content(candidate.name)
        expect(page).to have_content(candidate.votes)
        expect(page).to have_content(candidate.incumbent)
        expect(page).to have_content(candidate.election_id)
        expect(page).to have_content(candidate.created_at)
        expect(page).to have_content(candidate.updated_at)
      end
    end
  end
end