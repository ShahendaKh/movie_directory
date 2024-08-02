# frozen_string_literal: true

require 'smarter_csv'

namespace :csv_import do
  desc 'import movies'
  task movies: :environment do
    movies_csv_path = 'lib/assets/movies.csv'
    movies_map = {}
    p "Loading movies file from #{movies_csv_path}..."
    imported_movies = SmarterCSV.process(movies_csv_path)
    imported_movies.each do |movie|
      title = movie[:movie]
      if movies_map[title]
        map_movie = movies_map[title]
        map_movie[:description] = movie[:description]
        map_movie[:year] = movie[:year]
        map_movie[:director_name] = movie[:director]
        map_movie[:actor_names].add(movie[:actor])
        map_movie[:filming_locations].add("#{movie[:filming_location]}-#{movie[:country]}")
      else
        movies_map[title] = {
          description: movie[:description],
          year: movie[:year],
          director_name: movie[:director],
          actor_names: Set.new([movie[:actor]]),
          filming_locations: Set.new(["#{movie[:filming_location]}-#{movie[:country]}"])
        }
      end
    end
    p 'Importing the loaded movies...'
    movies_map.each do |title, data|
      director_attributes = { name: data[:director_name] }
      actors_attributes = data[:actor_names].map do |actor_name|
        { name: actor_name }
      end
      filming_locations_attributes = data[:filming_locations].map do |filming_location|
        name, country_code = filming_location.split('-')
        filming_location = FilmingLocation.by_name_and_country_code(name, country_code)
        filming_location_id = filming_location.present? ? filming_location.first.id : nil
        { filming_location_id: filming_location_id, name: name, country_code: country_code }
      end
      Movie.find_or_initialize_by(title: title)
           .update!(description: data[:description],
                    year: data[:year],
                    director_attributes: director_attributes,
                    actors_attributes: actors_attributes,
                    filming_locations_attributes: filming_locations_attributes)
    end
    p 'Movies import complete'
  end

  task reviews: :environment do
    reviews_csv_path = 'lib/assets/reviews.csv'
    p "Loading reviews file from #{reviews_csv_path}..."
    imported_reviews = SmarterCSV.process(reviews_csv_path)
    imported_reviews.each do |review|
      # TODO: Loading logic
    end
    p 'Importing the loaded reviews...'
    # TODO: Importing logic
    p 'Reviews import complete'
  end
end
