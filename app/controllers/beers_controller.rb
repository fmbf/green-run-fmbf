class BeersController < ApplicationController

  def index
    @beer = Beer.all
  end

  def new
    @beer = Beer.new
  end

  def create
    @beer = Beer.new(beer_params)

    if @beer.save
      redirect_to beer_url(@beer)
    else
      flash.now[:errors] = [@beer.errors.full_messages]
      render :new
    end
  end

  def show
    @beer = Beer.find_by(id: params[:id])
  end

  def edit
    @beer = Beer.find_by(id: params[:id])
  end

  def update
    @beer = Beer.find_by(id: params[:id])

    if @beer.update_attributes(beer_params)
      redirect_to beer_url(@beer)
    else
      flash.now[:errors] = [@beer.errors.full_messages]
      render :edit
    end
  end

  def destroy
    @beer = Beer.find_by(id: params[:id])
    @beer.destroy
    redirect_to beer_url(@beer)
  end

  private
  def beer_params
    params.require(:beer).permit(:name, :brewery_id)
  end
end