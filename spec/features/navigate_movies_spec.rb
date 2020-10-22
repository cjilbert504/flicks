require "rails_helper"

describe "Navigating movie pages" do
	
	it "Allows navigation from the show page to the index page" do
		movie = Movie.create(movie_attributes)

		visit movie_url(movie)

		click_link("All Movies")

		expect(current_path).to eq(movies_path)
	end

	it "Allows navigation from the index page to the selected movie show page" do
		movie = Movie.create(movie_attributes)

		visit movies_url

		click_link(movie.title)

		expect(current_path).to eq(movie_path(movie))
	end

end