require "rails_helper"

RSpec.describe "Courses", type: :system do
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

  it "creates a course" do
    visit courses_path
    click_link "New Course"

    fill_in "Title", with: "Mathematics"
    fill_in "Description", with: "Basic mathematics course"
    click_button "Create Course"

    expect(page).to have_content("Course was successfully created")
    expect(page).to have_content("Mathematics")
  end

  it "updates a course" do
    course = Course.create!(
      title: "Old Course",
      description: "Old description",
      user: user
    )

    visit edit_course_path(course)

    fill_in "Title", with: "Updated Course"
    click_button "Update Course"

    expect(page).to have_content("Course was successfully updated")
    expect(page).to have_content("Updated Course")
  end

  it "deletes a course" do
    Course.create!(
      title: "Delete Course",
      description: "Delete description",
      user: user
    )

    visit courses_path
    click_link "Destroy"

    expect(page).to have_content("Course was successfully deleted")
    expect(page).not_to have_content("Delete Course")
  end
end