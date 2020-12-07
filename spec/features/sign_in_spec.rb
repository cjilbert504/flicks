require 'rails_helper'

RSpec.describe "Signing in a user" do
	it "prompts for an email and password" do
		visit root_path
		click_link "Sign In"

		expect(current_path).to eq(new_session_path)
		expect(page).to have_field("Email")
		expect(page).to have_field("Password")
	end
end