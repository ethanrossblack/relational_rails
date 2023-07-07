require "rails_helper"

RSpec.describe "candidates index page", type: :feature do
  # As a visitor
  # When I visit '/child_table_name'
  # Then I see each Child in the system including the Child's attributes
  # (data from each column that is on the child table)
  describe "as a visitor" do
    describe "when I visit \"candidates\"" do
      it "then I see each Candidate in the system including the Candidate's attributes" do
        candidate1 = Candidate.create!(
          name: "Mike Johnston",
          votes: 42273,
          incumbent: false,
          election_id: 1
        )
        candidate2 = Candidate.create!(
          name: "Kelly Brough",
          votes: 34627,
          incumbent: false,
          election_id: 1
        )

        visit "/candidates"

        expect(page).to have_content(candidate1.name)
        expect(page).to have_content(candidate1.votes)
        expect(page).to have_content(candidate1.incumbent)
        expect(page).to have_content(candidate1.election_id)
        expect(page).to have_content(candidate1.created_at)
        expect(page).to have_content(candidate1.updated_at)

        expect(page).to have_content(candidate2.name)
        expect(page).to have_content(candidate2.votes)
        expect(page).to have_content(candidate2.incumbent)
        expect(page).to have_content(candidate2.election_id)
        expect(page).to have_content(candidate2.created_at)
        expect(page).to have_content(candidate2.updated_at)
      end
    end
  end
end