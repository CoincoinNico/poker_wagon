class Dealer
  def initialize
    @compteur = 0
    @board = []
  end

  def set_board(deck)
    deck.pick_card
  end

  def deal_board
    if compteur == 0
      3.times do
        self.set_board
      end
    elsif compteur == 3
      self.set_board
    elsif compteur == 4
      self.set_board
    end
  end

end

