require "rails_helper"

RSpec.describe "Assignments", type: :system do
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

  it "creates an assignment" do
    visit assignments_path
    click_link "New Assignment"

    fill_in "Title", with: "Exercise 1"
    fill_in "Description", with: "Complete basic questions"
    select "Mathematics", from: "Course"
    click_button "Create Assignment"

    expect(page).to have_content("Assignment was successfully created")
    expect(page).to have_content("Exercise 1")
  end

  it "updates an assignment" do
    assignment = Assignment.create!(
      title: "Old Assignment",
      description: "Old description",
      due_date: Date.today,
      course: course
    )

    visit edit_assignment_path(assignment)

    fill_in "Title", with: "Updated Assignment"
    click_button "Update Assignment"

    expect(page).to have_content("Assignment was successfully updated")
    expect(page).to have_content("Updated Assignment")
  end

  it "deletes an assignment" do
    Assignment.create!(
      title: "Delete Assignment",
      description: "Delete description",
      due_date: Date.today,
      course: course
    )

    visit assignments_path
    click_link "Destroy"

    expect(page).to have_content("Assignment was successfully deleted")
    expect(page).not_to have_content("Delete Assignment")
  end
end