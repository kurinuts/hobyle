class Genre < ApplicationRecord
  has_one_attached :image
  has_many :secondgenres, dependent: :destroy
  has_many :events, dependent: :destroy
  belongs_to :admin

  validates :name, presence: true
end
