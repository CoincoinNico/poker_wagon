# Encoding: utf-8

require "spec_helper"
require "hand_value"

describe "#hand_value" do

  it 'returns a straight flush' do
    HandValue.new([Card.new(7, 1), Card.new(8, 1),Card.new(9, 1), Card.new(10, 1), Card.new(11, 1)]).my_best_hand[0].must_equal "Straight Flush"
  end

  it 'returns a square' do
    HandValue.new([Card.new(12, 1), Card.new(12, 1),Card.new(12, 1), Card.new(12, 1), Card.new(10, 1)]).my_best_hand[0].must_equal "Four of a Kind"
  end

  it 'returns a full house' do
    HandValue.new([Card.new(12, 1), Card.new(12, 1),Card.new(12, 1), Card.new(10, 1), Card.new(10, 1)]).my_best_hand[0].must_equal "Full House"
  end

  it 'returns a flush' do
    HandValue.new([Card.new(11, 1), Card.new(12, 1),Card.new(13, 1), Card.new(8, 1), Card.new(2, 1)]).my_best_hand[0].must_equal "Flush"
  end

  it 'returns a straight' do
    HandValue.new([Card.new(12, 1), Card.new(10, 1),Card.new(11, 1), Card.new(13, 1), Card.new(9, 3)]).my_best_hand[0].must_equal "Straight"
  end

  it 'returns a three of a kind' do
    HandValue.new([Card.new(12, 1), Card.new(12, 1),Card.new(12, 3), Card.new(11, 1), Card.new(10, 1)]).my_best_hand[0].must_equal "Three of a Kind"
  end

  it 'returns two pairs' do
    HandValue.new([Card.new(12, 1), Card.new(12, 1),Card.new(2, 1), Card.new(2, 3), Card.new(10, 1)]).my_best_hand[0].must_equal "Two Pairs"
  end

  it 'returns a pair' do
    HandValue.new([Card.new(12, 1), Card.new(4, 1),Card.new(4, 1), Card.new(7, 3), Card.new(10, 1)]).my_best_hand[0].must_equal "Pair" #[Card.new(4, 1), Card.new(4, 1), Card.new(12, 1), Card.new(10, 1), Card.new(7, 3)]]
  end

  it 'returns a high card' do
    HandValue.new([Card.new(12, 1), Card.new(2, 3),Card.new(11, 1), Card.new(10, 1), Card.new(7, 1)]).my_best_hand[0].must_equal "High Card"
  end

end

