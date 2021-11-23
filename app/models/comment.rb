class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :tweet
  has_many :notifications, dependent: :destroy

  validates :comment, presence: true

end
