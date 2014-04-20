# returns the best combination of 5 cards among 5 cards
# the return is ordered. For Two Pairs:
# ["Two Pairs", [["High Pair"], ["High Pair"],["Low Pair"], ["Low Pair"], ["Kicker"]]
require_relative 'card.rb'

class HandValue

  def initialize(hand)
    @hand = hand
    @hand_sorted = @hand.sort { |x, y| y.number <=> x.number }
    @hand_numbers = hand_numbers(@hand)
    @hand_color = hand_colors(@hand)
  end

  def my_best_hand
    if is_straight_flush?
      ["Straight Flush", sort_best_hand]
    elsif is_four_of_a_kind?
      ["Four of a Kind", sort_best_hand]
    elsif is_full_house?
      ["Full House", sort_best_hand]
    elsif is_flush?
      ["Flush", @hand_sorted]
    elsif is_straight?
      ["Straight", @hand_sorted]
    elsif is_three_of_a_kind?
      ["Three of a Kind", sort_best_hand]
    elsif is_two_pairs?
      ["Two Pairs", sort_best_hand]
    elsif is_pair?
      ["Pair", sort_best_hand]
    else
      ["High Card", @hand_sorted]
    end
  end

  private
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

    #returns true if the combination is true at minima
    def is_straight_flush?
      is_flush? && is_straight? ? true : false
    end

    def is_four_of_a_kind?
      @hand_numbers.select { |k, v| v == 4 }.length ==1 ? true : false
    end

    def is_full_house?
      if @hand_numbers.select { |k, v| v == 3 }.length == 1
        true if @hand_numbers.select { |k, v| v == 2 }.length == 1
      else
        false
      end
    end

    def is_flush?
      @hand_color.length == 1 ? true : false
    end

    def is_straight?
      straight = true
      for i in 1...4 do
        straight = false unless @hand_sorted[i-1].number-1 == @hand_sorted[i].number
      end
      straight
    end

    def is_three_of_a_kind?
      @hand_numbers.select { |k, v| v == 3 }.length == 1 ? true : false
    end

    def is_two_pairs?
      @hand_numbers.select { |k, v| v == 2 }.length == 2 ? true : false
    end

    def is_pair?
      @hand_numbers.select { |k, v| v == 2 }.length == 1 ? true : false
    end

    def sort_best_hand
      #sort values by there occurrences, returns an array of arrays
      best_hand =[]
      occurences = @hand_numbers.to_a.sort_by {|a| [a[1], a[0]] }.reverse
      best_hand_numbers =[]
      #returns an array of values
      occurences.each do |occurence|
        occurence.last.times do
         best_hand_numbers << occurence.first
        end
      end
      #associates the color to the value
      #intermediate variable comme @hand_sorted to avoid a destroying method
      var = @hand.sort { |x, y| y.number <=> x.number }
      best_hand_numbers.each do |number|
        i = 0
        while var.length > 0 && number != var[i].number
        i += 1
        end
        best_hand << var[i]
        var.delete_at(i)
      end
      best_hand
    end

end