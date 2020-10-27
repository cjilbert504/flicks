require "rails_helper"

describe "Creating a new movie" do
	it "saves the movie and shows the new movie's details" do
		visit movies_url
		click_link "Add New Movie"

		expect(current_path).to eq(new_movie_path)

		fill_in "Title", with: "Point Break"
		fill_in "Description", with: "Bank robbing surfers get infilrated by an FBI agent"
		fill_in "Rating", with: "R"
		fill_in "Total gross", with: "83500000"
		fill_in "Released on", with: (Time.now.year - 1).to_s
		fill_in "Cast", with: "The award-winning cast"
		fill_in "Director", with: "The ever-creative director"
		fill_in "Duration", with: "123 min"
		fill_in "Image file name", with: "movie.png"

		click_button "Create Movie"

		expect(current_path).to eq(movie_path(Movie.last))
		expect(page).to have_text("Point Break")
	end
end