class Memory < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :event
  belongs_to :event_user

  validates :title, presence: true
  validates :comment, presence: true
end
