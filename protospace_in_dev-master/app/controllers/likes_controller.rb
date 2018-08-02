class LikesController < ApplicationController
  before_action :set_variables
  def create
    Like.create(user_id: current_user.id, prototype_id: params[:prototype_id])
    @likes = Like.where(prototype_id: params[:prototype_id])
    @prototypes = Prototype.all
    @likes_count = @likes.count
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, prototype_id: params[:prototype_id])
    like.destroy
    @likes = Like.where(prototype_id: params[:prototype_id])
    @likes_count = @likes.count
  end
 private

  def set_variables
    @prototype = Prototype.find(params[:prototype_id])
  end
end
