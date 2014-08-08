require 'rails_helper'

describe "Creating a new movie", type: :feature do 
  it "saves the movie and shows the new event's details" do    
    visit movies_url
    click_link 'Add New Movie'
    expect(current_path).to eq(new_movie_path)
    fill_in "Title", with: "New Movie Title"
    fill_in "Description", with: "Superheroes saving the world from villains"
    select "PG-13", from: "movie_rating"
    fill_in "Total gross", with: "75000000"
    select (Time.now.year - 1).to_s, :from => "movie_released_on_1i"
    fill_in "Cast", with: "The award-winning cast"
    fill_in "Director", with: "The ever-creative director"
    fill_in "Duration", with: "123 min"
    fill_in "Image file name", with: "movie.png" 
    click_button 'Create Movie'
    expect(current_path).to eq(movie_path(Movie.last))   
    expect(page).to have_text('New Movie Title')
    expect(page).to have_content('Movie successfully created!')
  end

  it "doesn't save movie, and re-renders the form with submitted values and error messages, if validations fail" do 
    visit new_movie_path
    expect{
      click_button "Create Movie"
    }.not_to change(Movie, :count)
    expect(current_path).to eq(movies_path)
    expect(page).to have_content('error')
  end
end
