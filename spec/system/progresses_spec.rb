require "rails_helper"

RSpec.describe "Progresses", type: :system do
  before { driven_by(:rack_test) }

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

  let!(:progress) do
    Progress.create!(
      student: student,
      course: course,
      completion_percentage: 50,
      status: "In Progress"
    )
  end

  before do
    visit login_path
    fill_in "Email", with: "mercy@example.com"
    fill_in "Password", with: "password"
    click_button "Login"
  end

  it "displays the progress list" do
    visit progresses_path

    expect(page).to have_content("Progresses")
    expect(page).to have_content(student.name)
    expect(page).to have_content(course.title)
    expect(page).to have_content("50%")
  end

  it "displays progress details" do
    visit progress_path(progress)

    expect(page).to have_content(student.name)
    expect(page).to have_content(course.title)
    expect(page).to have_content("50%")
    expect(page).to have_content("In Progress")
  end

  it "creates progress" do
    visit progresses_path
    click_link "New Progress"

    select "John Doe", from: "Student"
    select "Mathematics", from: "Course"
    fill_in "Completion Percentage", with: 70
    click_button "Create Progress"

    expect(page).to have_content("Progress was successfully created")
    expect(page).to have_content("70%")
  end

  it "updates progress" do
    visit edit_progress_path(progress)

    fill_in "Completion Percentage", with: 70
    click_button "Update Progress"

    expect(page).to have_content("Progress was successfully updated")
    expect(page).to have_content("70%")
  end

  it "deletes progress" do
    visit progresses_path

    within("tr", text: "John Doe") do
      click_link "Destroy"
    end

    expect(page).to have_content("Progress was successfully deleted")
  end
end