class Post < ActiveRecord::Base
  has_many :comments
  mount_uploader :image, ImageUploader
  validates :title, length: {minimum: 5, maximum: 40}, allow_blank: false
  validates :content, length: {minimum: 100, maximum: 10000}, allow_blank: false

  validates_presence_of [:image]
end
