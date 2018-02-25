<<<<<<< HEAD
require 'pry'

class MusicLibraryController
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = ""

    while input != "exit"
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
          list_songs
        when "list artists"
          list_artists
        when "list genres"
          list_genres
        when "list artist"
          list_songs_by_artist
        when "list genre"
          list_songs_by_genre
        when "play song"
          play_song
      end
    end
  end
  
  def list_songs
    Song.all.sort_by{|song| song.name}.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    Artist.all.sort_by{|artist| artist.name}.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}"
    end
  end
  
  def list_genres
    Genre.all.sort_by{|genre| genre.name}.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.strip
    if art = Artist.find_by_name(user_input)
      art.songs.sort_by{|song| song.name}.each.with_index(1) do |song, index|
        puts "#{index}. #{song.name} - #{song.genre.name}"
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.strip
    if genre = Genre.find_by_name(user_input)
      genre.songs.sort_by{|song| song.name}.each.with_index(1) do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if (1..Song.all.length).include?(input)
      song = Song.all.sort_by{|song| song.name}[input - 1]
    end

    puts "Playing #{song.name} by #{song.artist.name}" if song
=======
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
    user_input = gets.chomp
    while user_input != "exit"
      if user_input == "list songs"
        list_songs
      elsif user_input == "list artists"
        list_artists
      elsif user_input == "list genres"
        list_genres
      elsif user_input == "play song"
        puts "Which song number?"
        user_input = gets
        play_song(user_input.to_i)
      elsif user_input == "list artist"
        puts "Which artist?"
        user_input = gets
        artist_songs(user_input)
      elsif user_input == "list genre"
        puts "Which genre?"
        user_input = gets
        genre_songs(user_input)
      end
        def call
    user_input = gets.chomp
    while user_input != "exit"
      if user_input == "list songs"
        list_songs
      elsif user_input == "list artists"
        list_artists
      elsif user_input == "list genres"
        list_genres
      elsif user_input == "play song"
        puts "Which song number?"
        user_input = gets
        play_song(user_input.to_i)
      elsif user_input == "list artist"
        puts "Which artist?"
        user_input = gets
        artist_songs(user_input)
      elsif user_input == "list genre"
        puts "Which genre?"
        user_input = gets
        genre_songs(user_input)
      end
      user_input = gets
    end
  end
    end
  end
  
 def list_songs
    sorted_songs.each_with_index do |song, index|
      puts "#{index+1}. #{formatted_song(song)}"
    end
  end

  def list_artists
    Artist.all.each do |artist|
      puts artist.name
    end
  end

  def list_genres
    Genre.all.each do |genre|
      puts genre.name
    end
  end

  def play_song(number)
    puts "Playing #{formatted_song(sorted_songs[number - 1])}"
  end

  def artist_songs(name)
    Artist.find_by_name(name).songs.each do |song|
      puts formatted_song(song)
    end
  end

  def genre_songs(name)
    Genre.find_by_name(name).songs.each do |song|
      puts formatted_song(song)
    end
  end

  private
  def sorted_songs
    Song.all.sort_by { |song| song.artist.name }
  end

  def formatted_song(song)
    "#{song.artist.name} - #{song.name} - #{song.genre.name}"
>>>>>>> 4886972556d72c48a2066546e5baa2667f2070e3
  end
end