class Election < ApplicationRecord
  has_many :candidates
  
  validates_presence_of :name

  def num_candidates
    candidates.count
  end
end