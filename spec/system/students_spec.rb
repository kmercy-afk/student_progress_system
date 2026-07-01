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

  let!(:student) do
    Student.create!(
      name: "John Doe",
      email: "john@example.com",
      phone_number: "0712345678",
      user: user
    )
  end

  before do
    visit login_path
    fill_in "Email", with: "mercy@example.com"
    fill_in "Password", with: "password"
    click_button "Login"
  end

  it "displays the students list" do
    visit students_path

    expect(page).to have_content("Students")
    expect(page).to have_content(student.name)
  end

  it "displays a student's details" do
    visit student_path(student)

    expect(page).to have_content(student.name)
    expect(page).to have_content(student.email)
    expect(page).to have_content(student.phone_number)
  end

  it "creates a student" do
    visit students_path
    click_link "New Student"

    fill_in "Name", with: "Jane Doe"
    fill_in "Email", with: "jane@example.com"
    fill_in "Phone number", with: "0712345679"
    click_button "Create Student"

    expect(page).to have_content("Student was successfully created")
    expect(page).to have_content("Jane Doe")
  end

  it "updates a student" do
    visit edit_student_path(student)

    fill_in "Name", with: "Updated Name"
    click_button "Update Student"

    expect(page).to have_content("Student was successfully updated")
    expect(page).to have_content("Updated Name")
  end

  it "deletes a student" do
    visit students_path

    within("tr", text: "John Doe") do
      click_link "Destroy"
    end

    expect(page).to have_content("Student was successfully deleted")
    expect(page).not_to have_content("John Doe")
  end
end