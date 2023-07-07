class Election < ApplicationRecord
  has_many :candidates
  
  validates_presence_of :name
end