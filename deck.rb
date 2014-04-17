require_relative 'card.rb'

class Deck
  def initialize
    @deck_content = generate_deck
  end

  def generate_deck
    array = []
    for j in 1..4
      for i in 2..14
        array << Card.new(i, j)
      end
    end
    array
  end

  def pick_one_card
    @deck_content.shuffle!.pop
  end

  def generate_board
    board = []
    5.times do
      board << @deck_content.shuffle!.pop
    end
    board
  end

  def display_board(board)
    puts ""
    puts "The board is composed of:"
    board.each do |card|
      puts "- #{card}"
    end
    puts ""
  end
end

