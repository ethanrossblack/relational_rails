class Candidate < ApplicationRecord
  belongs_to :election

  def self.incumbents
    Candidate.where(incumbent: true)
  end
end