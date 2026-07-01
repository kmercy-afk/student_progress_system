require "rails_helper"

RSpec.describe "Access restrictions", type: :system do
  before do
    driven_by(:rack_test)
  end

  let!(:user) do
    User.create!(
      name: "Mercy",
      email: "mercy@example.com",
      password: "password",
      password_confirmation: "password",
      admin: false
    )
  end

  it "redirects unauthenticated users from dashboard to login page" do
    visit dashboard_path

    expect(page).to have_content("Please log in first")
    expect(current_path).to eq(login_path)
  end

  it "redirects unauthenticated users from students page to login page" do
    visit students_path

    expect(page).to have_content("Please log in first")
    expect(current_path).to eq(login_path)
  end

  it "redirects unauthenticated users from courses page to login page" do
    visit courses_path

    expect(page).to have_content("Please log in first")
    expect(current_path).to eq(login_path)
  end

  it "redirects unauthenticated users from assignments page to login page" do
    visit assignments_path

    expect(page).to have_content("Please log in first")
    expect(current_path).to eq(login_path)
  end

  it "redirects unauthenticated users from progresses page to login page" do
    visit progresses_path

    expect(page).to have_content("Please log in first")
    expect(current_path).to eq(login_path)
  end

  it "does not allow a normal user to access the admin dashboard" do
    visit login_path
    fill_in "Email", with: "mercy@example.com"
    fill_in "Password", with: "password"
    click_button "Login"

    visit admin_dashboard_path

    expect(page).to have_content("You are not authorized")
    expect(current_path).to eq(root_path)
  end
end