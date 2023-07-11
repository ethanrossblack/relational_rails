require "rails_helper"

describe Election, type: :model do
  before :each do
    @mayor = Election.create!(name: "Denver Mayor", priority: 1, year: 2023, runoff: false)

    @mayor_1 = @mayor.candidates.create!(name: "Mike Johnston", votes: 42273, incumbent: false)
    @mayor_2 = @mayor.candidates.create!(name: "Kelly Brough", votes: 34627, incumbent: false)
    @mayor_3 = @mayor.candidates.create!(name: "Lisa Calderón", votes: 31493, incumbent: false)
    @mayor_4 = @mayor.candidates.create!(name: "Andy Rougeot", votes: 19927, incumbent: false)
    @mayor_5 = @mayor.candidates.create!(name: "Leslie Herod", votes: 18506, incumbent: false)
  end

  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it { should have_many :candidates }
  end

  describe "instance methods" do
    # User Story 7 Parent Child Count
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

    # User Story 16, Sort Parent's Children in Alphabeticall Order by Name
    describe "#sort_candidates_a_z" do
      it "sorts candidates in alphabetical order by name" do
        mike = @mayor_1
        kelly = @mayor_2
        lisa = @mayor_3
        andy = @mayor_4
        leslie = @mayor_5

        sorted = @mayor.sort_candidates_a_z

        expect(sorted).to eq([andy, kelly, leslie, lisa, mike])
      end
    end
  end
end
