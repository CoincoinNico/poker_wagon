require_relative 'deck.rb'
require_relative 'game.rb'
require_relative 'card.rb'
require_relative 'player.rb'
require_relative 'hand_value_7.rb'


class Dealer

  attr_accessor :pot

  def initialize
    @pot = 0
  end

  def distribute_hands(players_array, deck)
    players_hands_array = []
    players_array.each do |player|
      players_hands_array << player.receive_hand(deck)
      puts "#{player.name} received a #{player.hand[0]} and a #{player.hand[1]}"
    end
    players_hands_array
  end

  def gather_blinds(players_array, first_to_bind, default_blind)
    puts ""
    puts "Blinds have been placed :"
    players_array.each_with_index do |player, index|
      if index == first_to_bind
        player.stack -= default_blind
        @pot += default_blind
        puts "- #{player.name} has placed a #{default_blind} blind"
      elsif (index == first_to_bind + 1 && players_array.length < (first_to_bind + 1))
        players_array[0].stack -= default_blind*2
        puts "- #{players_array[0].name} has placed a #{default_blind*2} blind"
      elsif (index == first_to_bind + 1 && players_array.length > (first_to_bind + 1))
        players_array[index].stack -= default_blind*2
        @pot += default_blind*2
        puts "- #{player.name} has placed a #{default_blind*2} blind"
      end
    end
  end

  def display_stacks(players_array)
    puts ""
    puts "Current stacks are :"
    players_array.each do |player|
      puts "- #{player.name}: #{player.stack}"
    end
    puts ""
  end

  def display_board(board)
    puts ""
    puts "The board is composed of:"
    board.each do |card|
      puts "- #{card}"
    end
    puts ""
  end

  def display_hands(players_array, players_hands, board)
    hands = []
    puts ""
    puts "The players have :"
    for i in 0...players_array.length do
      hands << [players_array[i].name, best_five_of_seven([players_hands[i][0], players_hands[i][1], board[0], board[1], board[2], board[3], board[4]])]
      puts "- #{players_array[i].name}: #{best_five_of_seven([players_hands[i][0], players_hands[i][1], board[0], board[1], board[2], board[3], board[4]])[0]} with #{best_five_of_seven([players_hands[i][0], players_hands[i][1], board[0], board[1], board[2], board[3], board[4]])[1]}"
    end
    puts ""

    winner = hands[0][0]
    winning_hand = hands[0][1]
      for i in 1...players_array.length do
        winning_hand = compare_two_hands(winning_hand, hands[i][1])
        winner = hands[i][0] if winning_hand == hands[i][1]
      end

    puts "The winner is : #{winner} with a #{winning_hand[0]} : #{winning_hand[1]}"

  end



  # compare elements of the array containings the hands and returns the winner
  def compare_hands(players_array, players_hands, board)
    display_hands(players_array, players_hands, board)
    winning_hand = hands[]
      for i in 1...21 do
        winning_hand = compare_two_hands(winning_hand, HandValue.new(five_in_seven[i]).my_best_hand)
      end
  winning_hand
  end

end