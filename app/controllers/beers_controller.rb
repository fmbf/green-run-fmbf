class BeersController < ApplicationController
  before_action :require_logged_in

  def index
    @beers = Beer.all
  end

  def new
    @beer = Beer.new
    @breweries = Brewery.all
  end

  def create
    @beer = Beer.new(beer_params)
    @breweries = Brewery.all

    if @beer.save
      redirect_to beer_url(@beer)
    else
      flash.now[:errors] = @beer.errors.full_messages
      render :new
    end
  end

  def show
    @beer = Beer.find_by(id: params[:id])
  end

  def edit
    @beer = Beer.find_by(id: params[:id])
    @breweries = Brewery.all
  end

  def update
    @beer = Beer.find_by(id: params[:id])
    @breweries = Brewery.all

    if @beer.update_attributes(beer_params)
      redirect_to beer_url(@beer)
    else
      flash.now[:errors] = @beer.errors.full_messages
      render :edit
    end
  end

  def destroy
    @beer = Beer.find_by(id: params[:id])
    @beer.destroy
    redirect_to beers_url
  end

  private
  def beer_params
    params.require(:beer).permit(
      :name,
      :brewery_id,
      :actively_brewed,
      :ibu,
      :abv,
      :flavors,
      :last_tapped_on,
    )
  end
end
