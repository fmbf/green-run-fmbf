class BreweriesController < ApplicationController
  before_action :require_logged_in

  def index
    @breweries = Brewery.all
  end

  def new
    @brewery = Brewery.new
  end

  def create
    @brewery = Brewery.new(brewery_params)

    if @brewery.save
      render :index
    else
      flash.now[:errors] = [@brewery.errors.full_messages]
      render :new
    end
  end

  def show
    @brewery = Brewery.find_by(id: params[:id])
  end

  def edit
    @brewery = Brewery.find_by(id: params[:id])
  end

  def update
    @brewery = Brewery.find_by(id: params[:id])

    if @brewery.update_attributes(brewery_params)
      redirect_to beers_url
    else
      flash.now[:errors] = [@brewery.errors.full_messages]
      render :edit
    end
  end

  def destroy
    @brewery = Brewery.find_by(id: params[:id])
    @brewery.destroy
    redirect_to beers_url
  end

  private
  def brewery_params
    params.require(:brewery).permit(:name)
  end
end
