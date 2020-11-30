require 'rails_helper'

RSpec.describe "Viewing the list of users" do
	it "shows a list of users" do
		user1 = User.create!(user_attributes(username: "BigLar", name: "Larry", email: "larry@example.com"))
    user2 = User.create!(user_attributes(username: "LittleMoe", name: "Moe",   email: "moe@example.com"))
		user3 = User.create!(user_attributes(username: "CurlyCue", name: "Curly", email: "curly@example.com"))

		visit users_url
		
		expect(page).to have_link(user1.name)
		expect(page).to have_link(user2.name)
		expect(page).to have_link(user3.name)
	end
end