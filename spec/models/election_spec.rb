require "rails_helper"

describe Election, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it { should have_many :candidates }
  end

  describe "instance methods" do
    describe "#num_candidates" do
      it "returns the number of Candidates in an Election" do
        mayor = Election.create!(name: "Denver Mayor", priority: 1, year: 2023, runoff: false)

        expect(mayor.num_candidates).to eq(0)
        
        mayor.candidates.create!(name: "Mike Johnston", votes: 42273, incumbent: false)
        mayor.candidates.create!(name: "Kelly Brough", votes: 34627, incumbent: false)
        mayor.candidates.create!(name: "Lisa Calderón", votes: 31493, incumbent: false)
        mayor.candidates.create!(name: "Andy Rougeot", votes: 19927, incumbent: false)
        
        expect(mayor.num_candidates).to eq(4)

        mayor.candidates.create!(name: "Leslie Herod", votes: 18506, incumbent: false)
        
        expect(mayor.num_candidates).to eq(5)
      end
    end
  end
end
