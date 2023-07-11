class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
  end

  def show
    @candidate = Candidate.find(params[:id])
  end

  def edit
    @candidate = Candidate.find(params[:id])
  end

  def update
    candidate = Candidate.find(params[:id])
    candidate.update(candidate_params)
    candidate.save
    redirect_to "/candidates/#{candidate.id}"
  end
  
  private
    def candidate_params
      params[:candidate].permit(:name, :votes, :incumbent)
    end
end

