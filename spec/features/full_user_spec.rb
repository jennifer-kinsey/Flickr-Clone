require "spec_helper"

describe "the adding new user process" do
  it "adds a new user" do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "k@email.com"
    fill_in "Password", with: "000000"
    fill_in "Password confirmation", with: "000000"
    fill_in "Name", with: "K"
    save_and_open_page
    click_button "Sign up"
    # expect(page).to have_content("User: k@email.com")
    expect(page).to have_content("Email has already been taken")
  end

  it "logs a user out" do
    visit "/"
    click_link "Sign in"
    fill_in "Email", with: "k@email.com"
    fill_in "Password", with: "000000"
    click_button "Log in"
    click_link "Sign out"
    # expect(page).to have_content("User: k@email.com")
    expect(page).to have_content("Signed out successfully.")
  end

  it "logs a user back in" do
    visit "/"
    click_link "Sign in"
    fill_in "Email", with: "k@email.com"
    fill_in "Password", with: "000000"
    click_button "Log in"
    # expect(page).to have_content("User: k@email.com")
    expect(page).to have_content("Signed in successfully.")
  end

  it "adds a new user" do
    visit "/"
    click_link "Sign up"
    click_button "Sign up"
    expect(page).to have_content("errors")
  end

  it "visits a user's page" do
    visit "/"
    click_link "Sign in"
    fill_in "Email", with: "k@email.com"
    fill_in "Password", with: "000000"
    click_button "Log in"
    click_link "k@email.com"
    expect(page).to have_content("New Picture")
  end


end
