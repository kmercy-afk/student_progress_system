require "rails_helper"

RSpec.describe "Assignments", type: :system do
  before { driven_by(:rack_test) }

  let!(:user) do
    User.create!(
      name: "Mercy",
      email: "mercy@example.com",
      password: "password",
      password_confirmation: "password"
    )
  end

  let!(:course) do
    Course.create!(
      title: "Mathematics",
      description: "Basic mathematics course",
      user: user
    )
  end

  let!(:assignment) do
    Assignment.create!(
      title: "Exercise 1",
      description: "Complete basic questions",
      due_date: Date.today,
      course: course
    )
  end

  before do
    visit login_path
    fill_in "Email", with: "mercy@example.com"
    fill_in "Password", with: "password"
    click_button "Login"
  end

  it "displays the assignments list" do
    visit assignments_path

    expect(page).to have_content("Assignments")
    expect(page).to have_content(assignment.title)
    expect(page).to have_content(course.title)
  end

  it "displays an assignment's details" do
    visit assignment_path(assignment)

    expect(page).to have_content(assignment.title)
    expect(page).to have_content(assignment.description)
    expect(page).to have_content(course.title)
  end

  it "creates an assignment" do
    visit assignments_path
    click_link "New Assignment"

    fill_in "Title", with: "Exercise 2"
    fill_in "Description", with: "Complete level two questions"
    select "Mathematics", from: "Course"
    fill_in "Due date", with: Date.today
    click_button "Create Assignment"

    expect(page).to have_content("Assignment was successfully created")
    expect(page).to have_content("Exercise 2")
  end

  it "updates an assignment" do
    visit edit_assignment_path(assignment)

    fill_in "Title", with: "Updated Assignment"
    click_button "Update Assignment"

    expect(page).to have_content("Assignment was successfully updated")
    expect(page).to have_content("Updated Assignment")
  end

  it "deletes an assignment" do
    visit assignments_path

    within("tr", text: "Exercise 1") do
      click_link "Destroy"
    end

    expect(page).to have_content("Assignment was successfully deleted")
    expect(page).not_to have_content("Exercise 1")
  end
end