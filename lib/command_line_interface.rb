def welcome
  # puts out a welcome message here!
  p "Welcome the Star Wars fan database!"
end

def get_character_from_user
  puts "please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  character = gets.downcase
end