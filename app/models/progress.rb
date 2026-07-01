class Progress < ApplicationRecord
  belongs_to :student
  belongs_to :course

  before_validation :set_status

  validates :student_id, presence: true
  validates :course_id, presence: true
  validates :completion_percentage,
            presence: true,
            numericality: {
              greater_than_or_equal_to: 0,
              less_than_or_equal_to: 100
            }

  private

  def set_status
    return if completion_percentage.blank?

    self.status =
      if completion_percentage.zero?
        "Not Started"
      elsif completion_percentage == 100
        "Completed"
      else
        "In Progress"
      end
  end
end