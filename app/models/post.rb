class Post < ActiveRecord::Base
  has_many :comments
  mount_uploader :image, ImageUploader
  validates_presence_of [:title, :content, :image]
end
