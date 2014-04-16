require_relative 'deck.rb'
require_relative 'dealer.rb'
require_relative 'game.rb'
require_relative 'card.rb'

class Player
  attr_reader :nom, :stack, :hand
  def initialize(name)
    @name = name
    @stack = 1000
    @hand = [ ]
  end
  #main_deux_cartes

  def receive_hand(deck)
    2.times do
      @hand << deck.pick_one_card
    end
    @hand
  end

end

p Player.new("Patrick Bruel")
toto = Player.new("Patrick Bruel").receive_hand(Deck.new)
p toto
