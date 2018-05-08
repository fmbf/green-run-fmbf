class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to beers_url
    else
      render :new
    end
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if @user
      login(@user)
      redirect_to beers_url
    else
      flash.now[:errors] = ['Invalid Credentials']
      render :new
    end

  end

  def destroy
    logout
    redirect_to new_session_url
  end
end
