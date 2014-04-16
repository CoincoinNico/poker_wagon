class Game
  def initialize(nb_joueur)
    @nb_joueur = nb_joueur
    @hand = []
  end

  def deal
    2.times do
      @hand << deck.pick_card

    end
  end

end


