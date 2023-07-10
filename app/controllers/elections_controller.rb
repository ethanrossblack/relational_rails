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

  def new  
  end

  def create
    Election.create!(name: params[:name], priority: params[:priority], year: params[:year], runoff: params[:runoff])
    redirect_to "/elections"
  end

  # private
  #   def election_params
  #     params.permit(:name)
  #     params.permit(:priority)
  #     params.permit(:year)
  #     params.permit(:runoff)
  #   end

end