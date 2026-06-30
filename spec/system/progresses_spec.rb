require "rails_helper"

RSpec.describe "Progresses", type: :system do
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

  let!(:course) do
    Course.create!(
      title: "Mathematics",
      description: "Basic mathematics course",
      user: user
    )
  end

  before do
    visit login_path
    fill_in "Email", with: "mercy@example.com"
    fill_in "Password", with: "password"
    click_button "Login"
  end

  it "creates progress" do
    visit progresses_path
    click_link "New Progress"

    select "John Doe", from: "Student"
    select "Mathematics", from: "Course"
    fill_in "Completion Percentage", with: 50
    select "In Progress", from: "Status"
    click_button "Create Progress"

    expect(page).to have_content("Progress was successfully created")
    expect(page).to have_content("50")
  end

  it "updates progress" do
    progress = Progress.create!(
      student: student,
      course: course,
      completion_percentage: 20,
      status: "Not Started"
    )

    visit edit_progress_path(progress)

    fill_in "Completion Percentage", with: 80
    select "Completed", from: "Status"
    click_button "Update Progress"

    expect(page).to have_content("Progress was successfully updated")
    expect(page).to have_content("80")
  end

  it "deletes progress" do
    Progress.create!(
      student: student,
      course: course,
      completion_percentage: 30,
      status: "In Progress"
    )

    visit progresses_path
    click_link "Destroy"

    expect(page).to have_content("Progress was successfully deleted")
  end
end