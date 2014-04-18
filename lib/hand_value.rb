require_relative 'card.rb'

class HandValue

  def initialize(hand)
    @card1 = hand[0]
    @card2 = hand[1]
    @card3 = hand[2]
    @card4 = hand[3]
    @card5 = hand[4]
    @hand = sort_hand
    @hand_numbers = hand_numbers(@hand)
    @hand_color = hand_colors(@hand)
  end

  def my_best_hand
    if is_straight_flush?
      ["Straight Flush", sort_best_hand]
    elsif is_square?
      ["Square", sort_best_hand]
    elsif is_full_house?
      ["Full House", sort_best_hand]
    elsif is_flush?
      ["Flush", @hand]
    elsif is_straight?
      ["Straight", @hand]
    elsif is_three_of_a_kind?
      ["Three of a Kind", sort_best_hand]
    elsif is_two_pairs?
      ["Two Pairs", sort_best_hand]
    elsif is_pair?
      ["Pair", sort_best_hand]
    else
      ["High Card", @hand]
    end
  end

  private
    def sort_hand
      [@card1, @card2, @card3, @card4, @card5].sort { |x, y| y.number <=> x.number }
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

    def is_straight_flush?
      is_flush? && is_straight? ? true : false
    end

    def is_square?
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
        straight = false unless @hand[i-1].number-1 == @hand[i].number
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
      best_hand =[]
      occurences = @hand_numbers.to_a.sort_by {|a| [a[1], a[0]] }.reverse
      winning_hand_numbers =[]
      occurences.each do |occurence|
        occurence.last.times do
         winning_hand_numbers << occurence.first
        end
      end
      winning_hand_numbers.each do |number|
        i = 0
        while @hand.length > 0 && number != @hand[i].number
        i += 1
        end
        best_hand << @hand[i]
        @hand.delete_at(i)
      end
      best_hand
    end

end