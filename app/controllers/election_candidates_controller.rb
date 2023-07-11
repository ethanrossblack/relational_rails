class ElectionCandidatesController < ApplicationController
  def index
    @election = Election.find(params[:id])
    @candidates = Candidate.where(election_id: params[:id])
  end

end