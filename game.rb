class Game

  attr_reader :number_of_players

  def initialize(number_of_players)
    @number_of_players = number_of_players
  end

  def get_players_names

    players_array = []
    number = 1

    @number_of_players.to_i.times do
      print "What is the name of Player ##{number} ? "
      player_name = gets.chomp
      players_array << Player.new(player_name)
      number += 1
    end

    players_array
  end

end