class Genre < ApplicationRecord
  has_one_attached :image
  has_many :secondgenres
  belongs_to :event
end
