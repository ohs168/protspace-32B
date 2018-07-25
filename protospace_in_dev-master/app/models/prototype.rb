class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :captured_images, dependent: :destroy
  has_many :tags, through: :tied_tags
  has_many :tied_tags

  accepts_nested_attributes_for :captured_images, reject_if: :reject_sub_images

  validates :title,
            :catch_copy,
            :concept,
            presence: true

  def reject_sub_images(attributed)
    attributed['content'].blank?
  end

  def set_main_thumbnail
    captured_images.main.first.content
  end

  def posted_date
    created_at.strftime('%b %d %a')
  end

  def save_posts(savepost_tags)
    # 保存するタグを判定する
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - savepost_tags
    new_tags = savepost_tags - current_tags

    # old_tagsの削除
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end

    # new_tagsの保存
    new_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(name:new_name)
      self.tags << post_tag
    end
  end
end
