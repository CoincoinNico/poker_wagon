require_relative 'card.rb'

class Deck
  def initialize
    @deck_content = generate
  end

  def generate
    array = []
    for j in 1..4
      for i in 2..14
        array << Card.new(i, j)
      end
    end
    array
  end

  def pick_one_card
    mix_deck = @deck_content.shuffle
    card = mix_deck.pop
  end

end


