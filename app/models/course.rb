class Course < ApplicationRecord
  belongs_to :user

  has_many :assignments, dependent: :destroy
  has_many :progresses, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
end