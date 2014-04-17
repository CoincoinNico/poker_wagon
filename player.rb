require_relative 'deck.rb'
require_relative 'game.rb'
require_relative 'card.rb'

class Player
  attr_reader :name, :stack, :hand
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

end
