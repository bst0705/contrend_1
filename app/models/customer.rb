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

  #自分からの通知
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  #相手からの通知
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  def is_followed_by?(customer)
    reverse_of_relationships.find_by(following_id: customer.id).present?
  end

  #退会したユーザーをログインできなくする
  def active_for_authentication?
    super && self.is_valid
  end

end
