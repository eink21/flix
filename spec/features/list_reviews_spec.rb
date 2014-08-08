require 'rails_helper'

describe "Viewing list of reviews", type: :feature do 
	it "lists reviews for a particular movie" do 
		movie = Movie.create(movie_attributes)
		review1 = movie.reviews.create(review_attributes(comment: "Test comment 1"))
		review2 = movie.reviews.create(review_attributes(comment: "Test comment 2"))
		visit movie_reviews_path(movie)
		expect(page).to have_content("Test comment 1")
		expect(page).to have_content("Test comment 2")
	end

	it "doesn't list reviews for an irrelevant movie" do 
		movie1 = Movie.create(movie_attributes)
		movie2 = Movie.create(movie_attributes)
		review = movie1.reviews.create(review_attributes(comment: "Test comment 1"))
		visit movie_reviews_path(movie2)
		expect(page).not_to have_content("Test comment 1")
	end
end