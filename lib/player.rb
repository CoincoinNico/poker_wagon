require_relative 'deck.rb'
require_relative 'game.rb'
require_relative 'card.rb'

class Player
  attr_reader :name, :hand, :bet_amount
  attr_accessor :stack
  def initialize(name)
    @name = name
    @stack = 1000
  end

  def receive_hand(deck)
    @hand = []
    2.times do
      @hand << deck.pick_one_card
    end
    @hand
  end

  def bet(last_bet)
    print "#{@name}: How much do you want to bet ? [Min. bet = #{last_bet}] "
    @bet_amount = gets.chomp.to_i
    if @bet_amount < last_bet
      print "#{@name}: You cannot bet less than #{last_bet}. Please bet again : "
      @bet_amount = gets.chomp.to_i
    end
    @stack -= @bet_amount
  end

end

