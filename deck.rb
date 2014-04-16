require_relative 'card.rb'

class Deck
  def initialize
    @deck_content = generate
  end

  def generate
    array = []
    for j in 1..4
      for i in 2..14
        array << Card.new(i, j).to_a
      end
    end
    array
  end

  def pick_one_card
    mix_deck = @deck_content.shuffle
    card = Card.new(mix_deck[0][0], mix_deck[0][1])
    @deck_content.delete([mix_deck[0][0], mix_deck[0][1]])
    card
  end

end


