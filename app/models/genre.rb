class Genre < ApplicationRecord
  has_one_attached :image
  has_many :secondgenres
  has_many :events
  belongs_to :admin

  validates :name, presence: true
end
