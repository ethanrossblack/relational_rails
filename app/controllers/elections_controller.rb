class ElectionsController < ApplicationController
  def index
    @elections = Election.order(created_at: :desc)
  end

  def show
    @election = Election.find(params[:id])
  end

  def candidates_index
    @election = Election.find(params[:id])
    @candidates = Candidate.where(election_id: params[:id])
  end
end