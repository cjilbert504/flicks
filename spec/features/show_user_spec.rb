require 'rails_helper'

RSpec.describe "Viewing a user's profile page" do
	it "shows the user's details" do
		user = User.create!(user_attributes)

		sign_in(user)
		visit user_url(user)
		
		expect(page).to have_text(user.username)
		expect(page).to have_text(user.name)
		expect(page).to have_text(user.email)
		expect(page).to have_text("Member since - #{Time.now.strftime("%B %Y")}")
	end

	context "when viewing another user's account" do
		it "doesn't display the links to edit or delete that user's account" do
			current_user = User.create!(user_attributes(username: "Wrong", email: "worng@example.com"))
			user = User.create!(user_attributes)

			sign_in(current_user)
			visit user_url(user)

			expect(page).not_to have_link("Edit Account")
			expect(page).not_to have_link("Delete Account")
		end
	end

	it "shows the user's favorites in the sidebar" do
		user = User.create!(user_attributes)
	
		movie = Movie.create!(movie_attributes)
		user.favorite_movies << movie
	
		sign_in(user)
	
		visit user_url(user)
	
		within("aside#sidebar") do
			expect(page).to have_text(movie.title)
		end
	end

	it "includes the user's name in the page title" do
		user = User.create!(user_attributes)

		sign_in(user)
		visit user_url(user)

		expect(page).to have_title("Flix - #{user.username}")
	end
end