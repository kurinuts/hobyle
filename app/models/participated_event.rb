class ParticipatedEvent < ApplicationRecord
  has_one_attached :image
  belongs_to :event
end
