require 'pry'

@all_movies = []


def random_runtime
  rand(100) + 62
end

def create_random_user
  random_user = User.create({ email: Faker::Internet.email, password: "12345", password_confirmation: "12345", firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, admin: false})
  raise "random user not valid" if !random_user.valid?
  random_user
end

def create_new_movie(user)
  new_movie = user.movies.new({ title: Faker::App.name, director: Faker::Name.name, runtime_in_minutes: random_runtime, description: Faker::Lorem.paragraph, release_date: Faker::Date.forward(365), remote_image_url: "http://placehold.it/300x450"})
  new_movie.save
  raise "random movie not valid" if !new_movie.valid?
  @all_movies << new_movie
end

def create_new_review(movie)
  new_review = movie.reviews.create({text: Faker::Lorem.paragraph, rating_out_of_ten: rand(10), user_id: @regular_user.id, movie_id: movie.id})
  raise "new review not valid" if !new_review.valid?
end



  



35.times do

  @regular_user = create_random_user

  rand(2).times do 
    create_new_movie(@regular_user)
  end

  rand(3).times do
    random_movie = @all_movies.sample
    create_new_review(random_movie)
  end

end

admin_user = User.create({ email: 'admin@gmail.com', password: "12345", password_confirmation: "12345", firstname: "jackson", lastname: "cunningham", admin: true})
