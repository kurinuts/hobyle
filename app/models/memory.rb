class Memory < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :event
  has_many :event_user

  validates :title, presence: true
  validates :comment, presence: true
end
