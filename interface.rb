require_relative 'player'
require_relative 'game'
require_relative 'card'
require_relative 'deck'
require_relative 'dealer'

puts ""
puts "                           .------."
puts "        .------.           |A .   |"
puts "        |A_  _ |    .------; / \\  |"
puts "        |( \\/ )|-----. _   |(_,_) |"
puts "        | \\  / | /\\  |( )  |  I  A|"
puts "        |  \\/ A|/  \\ |_x_) |------'"
puts "        `-----+'\\  / | Y  A|       "
puts "              |  \\/ A|-----'       "
puts "              `------'             "
puts ""
puts "                 Welcome to"
puts "            Le Wagon Poker Tour"
puts ""
puts ""
puts ""

# starts a new game and asks for the number of players
print "How many players take part in this game ? "
nb_of_players = gets.chomp
new_game = Game.new(nb_of_players)
puts ""
# creates the new players instances and stores them in an array
players = []

number = 1
new_game.number_of_players.to_i.times do
  print "What is the name of Player ##{number} ? "
  player_name = gets.chomp
  players << Player.new(player_name)
  number += 1
end

# creates a deck of 52 cards
deck_one = Deck.new

# gives each player a hand and stores them in an array

puts ""
players_hands = []

players.each do |player|
  players_hands << player.receive_hand(deck_one)
  puts "#{player.name} received a #{player.hand[0]} and a #{player.hand[1]}"
end

# each player contributes money to the pot
default_bet = 20
players.each do |player|
  player.stack -= default_bet
  dealer.pot += default_bet
end
puts ""
puts "Each player contributed #{default_bet}€ to the pot."
puts ""
# displays the board

board = deck_one.generate_board
puts ""
puts "The board is composed of:"
board.each do |card|
  puts "- #{card}"
end
puts ""

# dealer compares the hands and determines who won

new_dealer = Dealer.new

winner = new_dealer.compare_hands(players_hands)


# the winner gets the pot!

winner.stack += dealer.pot
dealer.pot = 0

puts ""
players.each do |player|
  puts "#{player.name} has #{player.stack}€ left"
end