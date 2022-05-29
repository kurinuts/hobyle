class EventUser < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :memories, dependent: :destroy

  enum status: { application: 0, participated: 1, memory: 2 }
end
