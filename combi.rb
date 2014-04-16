require_relative 'card.rb'

def best_of_5 (card1, card2, card3, card4, card5)
  best_hand = [card1, card2, card3, card4, card5].sort { |x, y| y.number <=> x.number }
  best_hand
end



a = Card.new(10, 1)
b = Card.new(7, 1)
c = Card.new(12, 1)
d = Card.new(9, 1)
e = Card.new(14, 1)

p best_of_5(a, b, c, d, e)