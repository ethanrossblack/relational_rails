require "rails_helper"

describe Election, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it { should have_many :candidates }
  end
end
