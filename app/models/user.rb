class User < ActiveRecord::Base
  has_many :comments   
  has_many :itens_cart 
  has_one :cliente
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def admin?
    admin
  end

  validates :email, length: {minimum: 5, maximum: 250}, allow_blank: false
  validates :username, length: {minimum: 5, maximum: 70}, allow_blank: false
end
