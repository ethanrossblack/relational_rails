class ElectionsController < ApplicationController
  def index
    @elections = Election.all
  end

  def show
    @election = Election.find(params[:id])
  end
end