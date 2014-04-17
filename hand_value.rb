require_relative 'card.rb'

class HandValue

  def initialize(card1, card2, card3, card4, card5, card6, card7)
    @card1 = card1
    @card2 = card2
    @card3 = card3
    @card4 = card4
    @card5 = card5
    @card6 = card6
    @card7 = card7
    @hand = sort_hand
    @hand_numbers = hand_numbers(@hand)
    @hand_color = hand_colors(@hand)
  end

  def is_square?
    @hand_numbers.length == 2 ? true : false
  end

  def is_full_house?

  end

  def is_flush?
    @hand_color.length == 1 ? true : false
  end

  private
    def sort_hand
      unsorted_hand = [@card1, @card2, @card3, @card4, @card5]
      sorted_hand = unsorted_hand.sort { |x, y| y.number <=> x.number }
    end

    def hand_numbers(array_of_cards)
      numbers = {}
      array_of_cards.each do |card|
        numbers[card.number] ? numbers[card.number] += 1 : numbers[card.number] = 1
      end
      numbers
    end

    def hand_colors(array_of_cards)
      colors = {}
      array_of_cards.each do |card|
        colors[card.color] ? colors[card.color] += 1 : colors[card.color] = 1
      end
      colors
    end

end


a = Card.new(10, 1)
b = Card.new(10, 1)
c = Card.new(10, 1)
d = Card.new(10, 1)
e = Card.new(9, 1)

HAND_TEST = [a, b, c, d, e]

hand = HandValue.new(a, b, c, d, e, e, e)

p hand

p hand.is_square?

p hand.is_flush?