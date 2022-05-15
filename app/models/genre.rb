class Genre < ApplicationRecord
  has_one_attached :image
  has_many :secondgenres
end
