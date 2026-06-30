class Student < ApplicationRecord
  belongs_to :user
  has_many :progresses, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
end