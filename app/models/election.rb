class Election < ApplicationRecord
  has_many :candidates
  
  validates_presence_of :name

  def num_candidates
    candidates.count
  end

  def sort_candidates_a_z
    candidates.order(:name)
  end
end