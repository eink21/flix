require 'rails_helper'

describe "Viewing an individual movie", type: :feature do
  it "shows the movie's details" do
    movie = Movie.create(movie_attributes)

    visit movie_url(movie)

    expect(page).to have_text(movie.title)
    expect(page).to have_text(movie.rating)
    expect(page).to have_text(movie.description)
    expect(page).to have_text(movie.released_on)
    expect(page).to have_text(movie.cast)
    expect(page).to have_text(movie.director)
    expect(page).to have_text(movie.duration)
    expect(page).to have_selector("img[src$='#{movie.image_file_name}']")
  end  
  
  it "shows the total gross if the total gross exceeds $50M" do
    movie = Movie.create(movie_attributes(total_gross: 60000000))
    visit movie_url(movie)
    expect(page).to have_text("$60,000,000.00")
  end

  it "shows 'Flop!' if the total gross is less than $50M" do
    movie = Movie.create(movie_attributes(total_gross: 40000000))
    visit movie_url(movie)
    expect(page).to have_text("Flop!")
  end

  it "shows the average number of stars from reviewers" do 
    movie = Movie.create(movie_attributes)
    review1 = movie.reviews.create(review_attributes(stars: 3))
    review2 = movie.reviews.create(review_attributes(stars: 4))
    visit movie_path(movie)
    expect(page).to have_content(3.5)
  end
end