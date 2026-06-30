require "rails_helper"

RSpec.describe Student, type: :model do
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
      name: "John Doe",
      email: "john@example.com",
      phone_number: "0712345678",
      user: user
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

    it "is invalid without a phone number" do
      subject.phone_number = nil
      expect(subject).not_to be_valid
    end

    it "is invalid without a user" do
      subject.user = nil
      expect(subject).not_to be_valid
    end
  end
end