class Article < ApplicationRecord
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations
 
  has_many :comments

  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  is_impressionable 

  def is_favorited?(user)
    self.favorited_users.include?(user)
  end
  
end
