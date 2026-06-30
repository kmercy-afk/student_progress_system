class User < ApplicationRecord
  has_secure_password
  has_many :students, dependent: :destroy
  has_many :courses, dependent: :destroy

  before_validation :downcase_email

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end
end