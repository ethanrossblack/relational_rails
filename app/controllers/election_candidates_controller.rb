class ElectionCandidatesController < ApplicationController
  def index
    @election = Election.find(params[:id])
    @candidates = Candidate.where(election_id: params[:id])
  end

  def new
    @election = Election.find(params[:id])
  end

end