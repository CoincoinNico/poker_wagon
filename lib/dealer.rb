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
      puts "We will show the hand of #{player.name}, press enter when you're ready to see it !"
      gets
      puts "#{player.name}, you have #{player.hand[0]} #{player.hand[1]}. Remember and press enter!"
      gets
      40.times do
        puts "*"
      end
    end
    players_hands_array
  end

  def gather_blinds(players_array, first_to_bind, default_blind)
    players_blinds_index = []
    puts ""
    puts "Blinds have been placed :"
    players_array.each_with_index do |player, index|
      if index == first_to_bind
        player.stack -= default_blind
        @pot += default_blind
        puts "- #{player.name} has placed a #{default_blind} small blind"
        index = players_blinds_index[0]
      elsif (index == first_to_bind + 1 && players_array.length <= (first_to_bind + 1))
        players_array[0].stack -= default_blind*2
        puts "- #{players_array[0].name} has placed a #{default_blind*2} big blind"
        index = players_blinds_index[1]
      elsif (index == first_to_bind + 1 && players_array.length > (first_to_bind + 1))
        players_array[index].stack -= default_blind*2
        @pot += default_blind*2
        puts "- #{player.name} has placed a #{default_blind*2} big blind"
        index = players_blinds_index[1]
      end
    end
    players_blinds_index
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
    s_board = board.sort_by { |card| card.number }.reverse
    puts "The board is composed of: #{s_board[0]} - #{s_board[1]} - #{s_board[2]} - #{s_board[3]} - #{s_board[4]}"
    puts ""
  end

  def ask_for_bets(players, blinders_index, default_blind)
    # rules of poker : first better must bet at least 2*blind
    bets = []
    last_bet = default_blind*2
    puts "It's time to bet!"
    puts ""
    begin
      players.each_with_index do |player, index|
        bets << player.bet(last_bet)
        # if player bets more than last bet than the new min bet is...
        last_bet = player.bet_amount if player.bet_amount > last_bet
      end
      # loops until bets are either equal or 0
    end
  end

  def display_bets(players)
    puts ""
    puts "Current bets are :"
    players.each do |player|
      if player.bet_amount == 0
        puts "-#{player.name} has folded."
      else
        puts "-#{player.name} has placed a #{player.bet_amount} bet."
      end
    end
  end

  # compare elements of the array containings the hands and returns the winner
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
end