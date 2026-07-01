require "rails_helper"

RSpec.describe Progress, type: :model do
  let(:user) do
    User.create!(
      name: "Mercy",
      email: "mercy@example.com",
      password: "password",
      password_confirmation: "password"
    )
  end

  let(:student) do
    Student.create!(
      name: "John Doe",
      email: "john@example.com",
      phone_number: "0712345678",
      user: user
    )
  end

  let(:course) do
    Course.create!(
      title: "Mathematics",
      description: "Basic mathematics course",
      user: user
    )
  end

  subject do
    described_class.new(
      student: student,
      course: course,
      completion_percentage: 50,
      status: "In Progress"
    )
  end

  context "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is invalid without a student" do
      subject.student = nil
      expect(subject).not_to be_valid
    end

    it "is invalid without a course" do
      subject.course = nil
      expect(subject).not_to be_valid
    end

    it "is invalid without completion percentage" do
      subject.completion_percentage = nil
      expect(subject).not_to be_valid
    end

    it "is invalid when completion percentage is less than 0" do
      subject.completion_percentage = -1
      expect(subject).not_to be_valid
    end

    it "is invalid when completion percentage is greater than 100" do
      subject.completion_percentage = 101
      expect(subject).not_to be_valid
    end

    it "is invalid when the same student already has progress for the same course" do
  Progress.create!(
    student: student,
    course: course,
    completion_percentage: 30,
    status: "In Progress"
  )

  duplicate_progress = Progress.new(
    student: student,
    course: course,
    completion_percentage: 60,
    status: "In Progress"
  )

  expect(duplicate_progress).not_to be_valid
   end
  end
end