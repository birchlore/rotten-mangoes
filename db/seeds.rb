@all_movies = []

@movie_posters = ["http://imgc.allpostersimages.com/images/P-473-488-90/17/1723/KK53D00Z/posters/the-terminator.jpg", "https://www.movieposter.com/posters/archive/main/68/MPW-34112", "https://blackwhiteandredposters.files.wordpress.com/2010/11/gamer-movie-poster.jpg", "http://www.dailyslandered.com/wp-content/uploads/2012/11/Cloverfield_FilmPosters.jpg", "http://gdj.gdj.netdna-cdn.com/wp-content/uploads/2011/12/grey-movie-poster.jpg", "http://gdj.gdj.netdna-cdn.com/wp-content/uploads/2012/10/movie+posters+16.jpg", "http://ifanboy.com/wp-content/uploads/2012/02/newavengersposter.jpg", "http://images.moviepostershop.com/winters-bone-movie-poster-2010-1020549245.jpg", "http://main-designyoutrust.netdna-ssl.com/wp-content/uploads/2012/11/titanic-movie-poster-1997-1020339699.jpg", "http://gdj.gdj.netdna-cdn.com/wp-content/uploads/2011/12/big-miracle-movie-poster.jpg", "http://1.media.dorkly.cvcdn.com/34/89/0e7378af2cf2fe59c89e87385530a8c3-the-best-of-videogame-movie-posters.jpg", "http://www.topdesignmag.com/wp-content/uploads/2011/04/lord-war-creative-movie-posters.jpg"]

def random_runtime
  rand(100) + 62
end

def create_random_user
  random_user = User.create({ email: Faker::Internet.email, password: "12345", password_confirmation: "12345", firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, admin: false})
  raise "random user not valid" if !random_user.valid?
  random_user
end

def create_new_movie(user)
  new_movie = user.movies.new({ title: Faker::App.name, director: Faker::Name.name, runtime_in_minutes: random_runtime, description: Faker::Lorem.paragraph, release_date: Faker::Date.forward(365), remote_image_url: @movie_posters.sample})
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
non_admin_user = User.create({ email: 'notadmin@gmail.com', password: "12345", password_confirmation: "12345", firstname: "jackson", lastname: "cunningham", admin: true})
