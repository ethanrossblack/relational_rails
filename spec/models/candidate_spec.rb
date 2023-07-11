require "rails_helper"

describe Candidate, type: :model do
  describe "relationships" do
    it { should belong_to :election }
  end

  describe "class methods" do
    before :each do
      @mayor = Election.create!(name: "Denver Mayor", priority: 1, year: 2023, runoff: false)
      @auditor = Election.create!(name: "Auditor", priority: 2, year: 2023, runoff: false)
      @clerk = Election.create!(name: "Clerk and Recorder", priority: 2, year: 2023, runoff: false)

      @mayor_1 = @mayor.candidates.create!(name: "Mike Johnston", votes: 42273, incumbent: false)
      @mayor_2 = @mayor.candidates.create!(name: "Kelly Brough", votes: 34627, incumbent: false)
      @mayor_3 = @mayor.candidates.create!(name: "Lisa Calderón", votes: 31493, incumbent: false)
      @mayor_4 = @mayor.candidates.create!(name: "Andy Rougeot", votes: 19927, incumbent: false)
      @mayor_5 = @mayor.candidates.create!(name: "Leslie Herod", votes: 18506, incumbent: false)

      @auditor_1 = @auditor.candidates.create!(name: "Timothy M. O'Brien", votes: 84856, incumbent: true)
      @auditor_2 = @auditor.candidates.create!(name: "Erik J. Clarke", votes: 58657, incumbent: false)

      @clerk_1 = @clerk.candidates.create!(name: "Paul D. López", votes: 128772, incumbent: true)
    end
    describe "#self.incumbents" do
      it "returns all incumbent candidates" do
        incumbents = Candidate.incumbents

        expect(incumbents).to contain_exactly(@auditor_1, @clerk_1)
      end
    end
  end
end
