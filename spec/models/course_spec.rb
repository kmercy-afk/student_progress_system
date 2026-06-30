require "rails_helper"

RSpec.describe Course, type: :model do
  let(:user) do
    User.create!(
      name: "Mercy",
      email: "mercy@example.com",
      password: "password",
      password_confirmation: "password"
    )
  end

  subject do
    described_class.new(
      title: "Mathematics",
      description: "Basic mathematics course",
      user: user
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

    it "is invalid without a user" do
      subject.user = nil
      expect(subject).not_to be_valid
    end
  end
end