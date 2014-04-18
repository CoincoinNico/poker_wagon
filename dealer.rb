require_relative 'deck.rb'
require_relative 'game.rb'
require_relative 'card.rb'
require_relative 'player.rb'

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
    players_blinds_index = []
    puts ""
    puts "Blinds have been placed :"
    players_array.each_with_index do |player, index|
      if index == first_to_bind
        player.stack -= default_blind
        @pot += default_blind
        puts "- #{player.name} has placed a #{default_blind}€ blind"
        index = players_blinds_index[0]
      elsif (index == first_to_bind + 1 && players_array.length < (first_to_bind + 1))
        players_array[0].stack -= default_blind*2
        puts "- #{players_array[0].name} has placed a #{default_blind*2}€ blind"
        index = players_blinds_index[1]
      elsif (index == first_to_bind + 1 && players_array.length > (first_to_bind + 1))
        players_array[index].stack -= default_blind*2
        @pot += default_blind*2
        puts "- #{player.name} has placed a #{default_blind*2}€ blind"
        index = players_blinds_index[1]
      end
    end
    players_blinds_index
  end

  def display_stacks(players_array)
    puts ""
    puts "Current stacks are :"
    players_array.each do |player|
      puts "- #{player.name}: #{player.stack}€"
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
        puts "-#{player.name} has placed a #{player.bet_amount}€ bet."
      end
    end
  end

  # compare elements of the array containings the hands and returns the winner
  def compare_hands(hands)
  end

end