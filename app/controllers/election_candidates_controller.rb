class ElectionCandidatesController < ApplicationController
  def index
    @election = Election.find(params[:id])
    @candidates = Candidate.where(election_id: params[:id])
  end

  def new
    @election = Election.find(params[:id])
  end
  
  def create
    @election = Election.find(params[:id])
    @election.candidates.create!(election_candidate_params)
    redirect_to "/elections/#{@election.id}/candidates"
  end
  
  private
    def election_candidate_params
      params.permit(:name, :votes, :incumbent)
    end

end