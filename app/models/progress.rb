class Progress < ApplicationRecord
  belongs_to :student
  belongs_to :course

  validates :student_id, presence: true
  validates :course_id, presence: true
  validates :completion_percentage, presence: true,
                                    numericality: {
                                      greater_than_or_equal_to: 0,
                                      less_than_or_equal_to: 100
                                    }
  validates :status, presence: true
end