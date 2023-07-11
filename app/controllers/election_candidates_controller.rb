class ElectionCandidatesController < ApplicationController
  def index
    @election = Election.find(params[:id])
    
    if params[:sort] == "name"
      @candidates = @election.sort_candidates_a_z
    else
      @candidates = @election.candidates
    end
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