class User < ApplicationRecord
  has_one_attached :image
  has_many :events, dependent: :destroy
  has_many :event_users, dependent: :destroy
  has_many :memories, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum age: { age20: 1, age30: 2,  age40: 3, age50: 4, age60: 5, age70: 6, age80: 7 }
end
