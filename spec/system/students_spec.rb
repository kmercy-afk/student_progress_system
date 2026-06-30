require "rails_helper"

RSpec.describe "Students", type: :system do
  before do
    driven_by(:rack_test)
  end

  let!(:user) do
    User.create!(
      name: "Mercy",
      email: "mercy@example.com",
      password: "password",
      password_confirmation: "password"
    )
  end

  before do
    visit login_path
    fill_in "Email", with: "mercy@example.com"
    fill_in "Password", with: "password"
    click_button "Login"
  end

  it "creates a student" do
    visit students_path
    click_link "New Student"

    fill_in "Name", with: "John Doe"
    fill_in "Email", with: "john@example.com"
    fill_in "Phone number", with: "0712345678"
    click_button "Create Student"

    expect(page).to have_content("Student was successfully created")
    expect(page).to have_content("John Doe")
  end

  it "updates a student" do
    student = Student.create!(
      name: "Old Name",
      email: "old@example.com",
      phone_number: "0712345678",
      user: user
    )

    visit edit_student_path(student)

    fill_in "Name", with: "Updated Name"
    click_button "Update Student"

    expect(page).to have_content("Student was successfully updated")
    expect(page).to have_content("Updated Name")
  end

  it "deletes a student" do
    student = Student.create!(
      name: "Delete Me",
      email: "delete@example.com",
      phone_number: "0712345678",
      user: user
    )

    visit students_path
    click_link "Destroy"

    expect(page).to have_content("Student was successfully deleted")
    expect(page).not_to have_content("Delete Me")
  end
end