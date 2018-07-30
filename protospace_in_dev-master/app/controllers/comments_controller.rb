class CommentsController < ApplicationController
  before_action :set_prototype
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create]

  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html { redirect_to prototype_path(@prototype.id) }
      format.json
    end
  end

  def edit
  end

  def update
    @comment.update(comment_params) if @comment.user_id == current_user.id
    redirect_to prototype_path(@prototype.id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy if @comment.user_id == current_user.id
    redirect_to prototype_path(@prototype.id)
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: @prototype.id)
  end
end
