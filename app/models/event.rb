class Event < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :genres
  has_many :secondgenre
  has_many :applications
  validates :daytime, presence: true
end
