require 'rails_helper'

describe "Navigating reviews", type: :feature do 
	it "allows user to navigate from movie show page to movie reviews page" do 
		movie = Movie.create(movie_attributes)
		review = movie.reviews.create(review_attributes)
		visit movie_path(movie)
		click_link "1 review"
		expect(current_path).to eq(movie_reviews_path(movie))
	end

	it "allows user to navigate from movie show page to new movie review form" do 
		movie = Movie.create(movie_attributes)
		visit movie_path(movie)
		click_link "Write Review"
		expect(current_path).to eq(new_movie_review_path(movie))
	end
end