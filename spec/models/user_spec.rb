require "rails_helper"

RSpec.describe User, type: :model do
  subject do
    described_class.new(
      name: "Mercy",
      email: "mercy@example.com",
      password: "password",
      password_confirmation: "password"
    )
  end

  context "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is invalid without a name" do
      subject.name = nil
      expect(subject).not_to be_valid
    end

    it "is invalid without an email" do
      subject.email = nil
      expect(subject).not_to be_valid
    end

    it "is invalid without a password" do
      subject.password = nil
      expect(subject).not_to be_valid
    end

    it "is invalid if the password confirmation does not match" do
      subject.password_confirmation = "different"
      expect(subject).not_to be_valid
    end
  end
end