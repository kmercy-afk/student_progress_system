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

  it "displays the courses list" do
    visit courses_path

    expect(page).to have_content("Courses")
    expect(page).to have_content(course.title)
  end

  it "displays a course's details" do
    visit course_path(course)

    expect(page).to have_content(course.title)
    expect(page).to have_content(course.description)
  end

  it "creates a course" do
    visit courses_path
    click_link "New Course"

    fill_in "Title", with: "Science"
    fill_in "Description", with: "Basic science course"
    click_button "Create Course"

    expect(page).to have_content("Course was successfully created")
    expect(page).to have_content("Science")
  end

  it "updates a course" do
    visit edit_course_path(course)

    fill_in "Title", with: "Updated Course"
    click_button "Update Course"

    expect(page).to have_content("Course was successfully updated")
    expect(page).to have_content("Updated Course")
  end

  it "deletes a course" do
    visit courses_path

    within("tr", text: "Mathematics") do
      click_link "Destroy"
    end

    expect(page).to have_content("Course was successfully deleted")
    expect(page).not_to have_content("Mathematics")
  end
end