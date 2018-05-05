class CommentsController < ApplicationController
  before_action :require_logged_in

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.beer_id = params[:beer_id]

    if @comment.save
      redirect_to beer_url(params[:beer_id])
    else
      flash[:errors] = [@comment.errors.full_messages]
      redirect_to beer_url(params[:beer_id])
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    redirect_to beer_url(@comment.beer)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
