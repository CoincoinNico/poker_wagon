require_relative 'player'
require_relative 'game'
require_relative 'card'
require_relative 'deck'


# start a new game and ask for the number of players
print "How many player take part in this game ? "
nb_of_players = gets.chomp
new_game = Game.new(nb_of_players)
puts ""
# create the new players and store them in an array
players = []

number = 1
new_game.number_of_players.to_i.times do
  print "What is the name of Player ##{number} ? "
  player_name = gets.chomp
  players << Player.new(player_name)
  number += 1
end

# create a deck of 52 cards
new_deck = Deck.new

# give each player a hand and stores them in an array

puts ""
players_hands = []

players.each do |player|
  players_hands << player.receive_hand(new_deck)
  puts "#{player.name} received a #{player.hand[0]} and a #{player.hand[1]}"
end

# display the board

board = new_deck.generate_board
puts ""
puts "The board is composed of:"
board.each do |card|
  puts "- #{card}"
end
puts ""

# dealer compares the hands and determines who won

new_dealer = Dealer.new
puts new_dealer.compare_hands(players_hands)

# the winner gets the money