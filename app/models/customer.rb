class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  #フォローする側からみた関係
  has_many :relationships, foreign_key: :following_id
  has_many :followings, through: :relationships, source: :follower

  #フォローされる側からみた関係
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: :follower_id
  has_many :followers, through: :reverse_of_relationships, source: :following

  def is_followed_by?(customer)
    reverse_of_relationships.find_by(following_id: customer.id).present?
  end

  def active_for_authentication?
    super && self.is_valid
  end

end
