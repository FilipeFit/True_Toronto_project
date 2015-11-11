class User < ActiveRecord::Base
  has_many :comments    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def admin?
    admin
  end

  validates_presence_of :username
  validates_uniqueness_of :username
end
