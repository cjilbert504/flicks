require 'rails_helper'

RSpec.describe "Signing in a user" do
	it "prompts for an email and password" do
		visit root_path
		click_link "Sign In"

		expect(current_path).to eq(signin_path)
		expect(page).to have_field("Email")
		expect(page).to have_field("Password")
	end

	it "has a link to sign up if the user doesn't have an account" do
		visit signin_path

		expect(page).to have_text("Don't have an account? Sign Up")
	end

	it "redirects to the users show page upon successful authentication" do
		user = User.create!(user_attributes)

		visit signin_path

		fill_in "Email", with: "#{user.email}"
		fill_in "Password", with: "secret"
		click_button "Sign In"

		expect(current_path).to eq(user_path(user))
		expect(page).to have_text("Welcome back, #{user.name}")
		expect(page).to have_link(user.name)
		expect(page).to have_link('Sign Out')
		expect(page).not_to have_link("Sign In")
		expect(page).not_to have_link("Sign Up")
	end

	it "renders the sign in form again if authentication is unsuccessful" do
		user = User.create!(user_attributes)

		visit signin_path

		fill_in "Email", with: "#{user.email}"
		fill_in "Password", with: "no match"
		click_button "Sign In"

		expect(page).to have_text("Invalid")
		expect(page).not_to have_link(user.name)
		expect(page).not_to have_link('Sign Out')
		expect(page).to have_link("Sign In")
		expect(page).to have_link("Sign Up")
	end

	it "redirects to the intended url after signing in" do
		user = User.create!(user_attributes)

		visit users_url
		expect(current_path).to eq(new_session_path)
		sign_in(user)

		expect(current_path).to eq(users_path)
	end
end