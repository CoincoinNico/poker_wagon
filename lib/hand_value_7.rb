require_relative 'hand_value.rb'

 # define an order between figures
  COMBINATION_VALUE = {
  "Straight Flush"  => 8,
  "Square"          => 7,
  "Full House"      => 6,
  "Flush"           => 5,
  "Straight"        => 4,
  "Three of a Kind" => 3,
  "Two Pairs"       => 2,
  "Pair"            => 1,
  "High Card"       => 0,
  }

# return the best hand of two, or random if draw.
def compare_two_hands(hand_1, hand_2)
  # compare figures.
  if COMBINATION_VALUE[hand_1.first] >= COMBINATION_VALUE[hand_2.first]
    hand_1
  elsif COMBINATION_VALUE[hand_1.first] < COMBINATION_VALUE[hand_2.first]
    hand_2
  # if figures are tied, compare highest key cards in the right order.
  else
    for i in 0..4
      if hand_1.last[i].number > hand_2.last[i].number
        return hand_1
      elsif hand_1.last[i].number < hand_2.last[i].number
        return hand_2
      end
    end
    # if draw, return random hand.
    [[hand_1],[hand_2]].shuffle[0]
  end
end

# return the best hand out of seven cards
def best_five_of_seven (cards)
  # stock all the combinations of five cards in an array
  five_in_seven =  [[cards[0], cards[1], cards[2], cards[3], cards[4]],
                    [cards[0], cards[1], cards[2], cards[3], cards[5]],
                    [cards[0], cards[1], cards[2], cards[3], cards[6]],
                    [cards[0], cards[1], cards[2], cards[4], cards[5]],
                    [cards[0], cards[1], cards[2], cards[4], cards[6]],
                    [cards[0], cards[1], cards[2], cards[5], cards[6]],
                    [cards[0], cards[1], cards[3], cards[4], cards[5]],
                    [cards[0], cards[1], cards[3], cards[4], cards[6]],
                    [cards[0], cards[1], cards[4], cards[5], cards[6]],
                    [cards[0], cards[1], cards[4], cards[5], cards[6]],
                    [cards[0], cards[2], cards[3], cards[4], cards[5]],
                    [cards[0], cards[2], cards[3], cards[4], cards[6]],
                    [cards[0], cards[2], cards[3], cards[5], cards[6]],
                    [cards[0], cards[2], cards[4], cards[5], cards[6]],
                    [cards[0], cards[3], cards[4], cards[5], cards[6]],
                    [cards[1], cards[2], cards[3], cards[4], cards[5]],
                    [cards[1], cards[2], cards[3], cards[4], cards[6]],
                    [cards[1], cards[2], cards[3], cards[5], cards[6]],
                    [cards[1], cards[2], cards[4], cards[5], cards[6]],
                    [cards[1], cards[3], cards[4], cards[5], cards[6]],
                    [cards[2], cards[3], cards[4], cards[5], cards[6]]]
  #compare all combinations and stock the best one
  winning_hand = HandValue.new(five_in_seven[0]).my_best_hand
  for i in 1...21 do
    winning_hand = compare_two_hands(winning_hand, HandValue.new(five_in_seven[i]).my_best_hand)
  end
  winning_hand
end







