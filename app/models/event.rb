class Event < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :genre, optional: true
  has_many :event_users

  validates :daytime, presence: true
end
