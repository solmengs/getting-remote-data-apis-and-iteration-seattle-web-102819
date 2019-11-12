require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  # name = character_name
  # go into films and pull out all values in an array

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.

  character = response_hash["results"].find {|results| results["name"] == character_name}
  character["films"].map {|film| RestClient.get(film)}

end
binding.pry

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  info = films.map {|data| JSON.parse(data)}
  # info.map {|arr| arr["title"]}
end
# binding.pry

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

# binding.pry
# 0

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?