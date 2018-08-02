class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :prototype

  def like_user(user_id)
    Like.user.find_by(user_id: user_id)
  end
end
