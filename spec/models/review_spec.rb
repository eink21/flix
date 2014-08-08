require 'rails_helper'

describe Review, type: :model do 
	it "belongs to a movie" do 
		movie = Movie.create(movie_attributes)
		review = movie.reviews.new(review_attributes)
		expect(review.movie).to eq(movie)
	end

	it "with example attributes is valid" do 
		review = Review.new(review_attributes)
		expect(review.valid?).to eq(true)
	end

	it "requires a name" do 
		review = Review.new(name: '')
		review.valid? #populations review.errors
		expect(review.errors[:name].any?).to eq(true)
	end

	it "requires a comment" do 
		review = Review.new(comment: '')
		review.valid?
		expect(review.errors[:comment].any?).to eq(true)
	end

	it "requires a comment over 3 characters" do 
		review1 = Review.new(comment: 'hi')
		review2 = Review.new(comment: 'hello')
		review1.valid?
		review2.valid?
		expect(review1.errors[:comment].any?).to eq(true)
		expect(review2.errors[:comment].any?).to eq(false)
	end

	it "accepts star values of 1 through 5" do 
		1.upto(5) do |x|
			review = Review.new(stars: x)
			review.valid?
			expect(review.errors[:stars].any?).to eq(false)
		end
	end

	it "rejects invalid star values" do 
		stars = [-1, 0, 6]
		stars.each do |x|
			review = Review.new(stars: x)
			review.valid?
			expect(review.errors[:stars].any?).to eq(true)
			expect(review.errors[:stars].first).to eq("must be between 1 and 5")
		end
	end
end