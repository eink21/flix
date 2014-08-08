require 'rails_helper'

describe "Creating a movie review", type: :feature do 
	it "creates review when field validations pass" do 
		movie = Movie.create(movie_attributes)
		visit new_movie_review_path(movie)
		fill_in 'Name', with: review_attributes[:name]
		choose ("review_stars_" + review_attributes[:stars])
		fill_in 'Comment', with: review_attributes[:comment]
		click_button 'Post Review'
		expect(current_path).to eq(movie_reviews_path(movie))
		expect(page).to have_content("Thanks for your review!")
	end

	it "doesn't create review when field validations fail" do 
		movie = Movie.create(movie_attributes)
		visit new_movie_review_path(movie)
		expect {
			click_button 'Post Review'
		}.not_to change(Review, :count)
		expect(page).to have_content("error")
	end
end