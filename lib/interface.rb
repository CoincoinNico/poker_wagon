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
print "How many players will play this game ? "
nb_of_players = gets.chomp
new_game = Game.new(nb_of_players)
puts ""
# creates the new players instances and stores them in an array
players_array = new_game.get_players_names

# starts the first round
round = 1
first_to_bind = 1
begin
  puts ""
  sleep 1
  puts "Beginning round ##{round}..."
  sleep 2
  # creates a deck of 52 cards
  deck_one = Deck.new
  puts ""

  # gives each player a hand and stores them in an array
  new_dealer = Dealer.new
  players_hands = new_dealer.distribute_hands(players_array, deck_one)
  sleep 2
  # the dealer gathers the blinds
  default_blind = 20
  new_dealer.gather_blinds(players_array, first_to_bind, default_blind)
  new_dealer.display_stacks(players_array)
  sleep 2
  # displays the board
  board = deck_one.generate_board
  new_dealer.display_board(board)
  sleep 2

  sleep 3
  # # dealer compares the hands and determines who won
  new_dealer.display_hands(players_array, players_hands, board)
  # winner = new_dealer.compare_hands(players_hands)


  # # the winner gets the pot!
  # winner.stack += dealer.pot
  # dealer.pot = 0
  # new_dealer.display_stacks(players_array)

  puts "Do you want to play a new round ? (yes/no)"
  answer = gets.chomp
  round += 1
  (first_to_bind + 1) >= players_array.length ? first_to_bind += 1 : first_to_bind = 0
end until answer == "no"
