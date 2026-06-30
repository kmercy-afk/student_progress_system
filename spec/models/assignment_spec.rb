require "rails_helper"

RSpec.describe Assignment, type: :model do
  let(:user) do
    User.create!(
      name: "Mercy",
      email: "mercy@example.com",
      password: "password",
      password_confirmation: "password"
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
      title: "Exercise 1",
      description: "Complete basic questions",
      due_date: Date.today,
      course: course
    )
  end

  context "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is invalid without a title" do
      subject.title = nil
      expect(subject).not_to be_valid
    end

    it "is invalid without a description" do
      subject.description = nil
      expect(subject).not_to be_valid
    end

    it "is invalid without a due date" do
      subject.due_date = nil
      expect(subject).not_to be_valid
    end

    it "is invalid without a course" do
      subject.course = nil
      expect(subject).not_to be_valid
    end
  end
end