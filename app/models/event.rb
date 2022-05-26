class Event < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :genre, optional: true
  has_many :event_users, dependent: :destroy

  validates :daytime, presence: true
  validates :is_active, inclusion: { in: [true, false] }
  # enum is_active: { recruitment: 0, deadline: 1, default: 0 }
end
