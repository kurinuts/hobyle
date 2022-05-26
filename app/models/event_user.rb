class EventUser < ApplicationRecord
  belongs_to :user
  belongs_to :event

  enum status: { application: 0, participated: 1, memory: 2 }
end
