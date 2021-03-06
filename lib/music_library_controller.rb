class MusicLibraryController

def initialize(path='./db/mp3s')
  MusicImporter.new(path).import
end
  
def call
  puts "Welcome to your music library!"
  puts "To list all of your songs, enter 'list songs'."
  puts "To list all of the artists in your library, enter 'list artists'."
   puts "To list all of the genres in your library, enter 'list genres'."
  puts "To list all of the songs by a particular artist, enter 'list artist'."
  puts "To list all of the songs of a particular genre, enter 'list genre'."
  puts "To play a song, enter 'play song'."
  puts "To quit, type 'exit'."
  puts "What would you like to do?"
  
  input = gets.strip
  
  case input
  when "list songs"
    #do something
    main_menu
  when "list artists"
    main_menu
  when "list artist"
    main_menu
  when "list genre"
    main_menu
  when "list genres"
    main_menu
  when "play song"
    main_menu
  when "exit"
    exit
  else
    puts "Invalid choice"
    main_menu
  end
end

def list_songs
  Song.alphabetize.each.with_index(1) do |song, index|
    puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end
  
end

