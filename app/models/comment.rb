class Comment < ActiveRecord::Base
  belongs_to :job   
  belongs_to :user

  validates :body, length: {minimum: 10, maximum: 500}, allow_blank: false
  validates_presence_of [:user_id, :post_id]

end
