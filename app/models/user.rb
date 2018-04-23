class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :comments
  def admin?
    self.role == "site_admin"
  end
end
