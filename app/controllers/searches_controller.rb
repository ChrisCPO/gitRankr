class SearchesController < ApplicationController
  def show
    @groups = Group.where("name ILIKE ?", "%#{params[:search]}%")
  end
end
