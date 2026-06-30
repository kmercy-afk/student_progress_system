class Assignment < ApplicationRecord
  belongs_to :course

  validates :title, presence: true
  validates :description, presence: true
  validates :due_date, presence: true
end