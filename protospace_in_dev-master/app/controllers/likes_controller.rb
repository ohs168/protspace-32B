class LikesController < ApplicationController
  before_action :set_variables
  def create
    @like = Like.create(user_id: current_user.id, prototype_id: params[:prototype_id])
    @likes = Like.where(prototype_id: params[:prototype_id])
    @prototypes = Prototype.all
    @likes_count = @prototype.likes.where(prototype_id: params[:id]).count
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, prototype_id: params[:prototype_id])
    like.destroy
    @likes = Like.where(prototype_id: params[:prototype_id])
    @prototypes = Prototype.all
    @likes_count = @prototype.likes.where(prototype_id: params[:id]).count
  end
 private

  def set_variables
    @prototype = Prototype.find(params[:prototype_id])
    # @id_name = "#like-link-#{@prototype.id}"
    # @id_heart = "#heart-#{@prototype.id}"
  end
end






# class LikesController < ApplicationController
#   def create
#     @like = Like.create(user_id: current_user.id, prototype_id: params[:prototype_id])
#     @likes = Like.where(prototype_id: params[:prototype_id])
#     respond_to do |format|
#       format.html { redirect_to prototype_path(params[:prototype_id])  }
#       format.json
#     end
#   end

#   def destroy
#     @like = current_user.likes.find_by(prototype_id: params[:prototype_id])
#     @like.destroy
#     @likes = Like.where(prototype_id: params[:prototype_id])
#     espond_to do |format|
#       format.html { redirect_to prototype_path(params[:prototype_id])  }
#       format.json
#     end
#   end
# end



  # before_action :set_prototype

  # def create
  #   @like = Like.create(user_id: current_user.id, prototype_id: params[:prototype_id])
  #   @likes = Like.where(prototype_id: params[:prototype_id])
  #   @prototype.reload
  # end

  # def destroy
  #   like = Like.find_by(user_id: current_user.id, prototype_id: params[:prototype_id])
  #   like.destroy
  #   @likes = Like.where(prototype_id: params[:prototype_id])
  #   @prototype.reload
  # end

  # private

  # def set_prototype
  #   @prototype = Prototype.find(params[:prototype_id])
  # end
