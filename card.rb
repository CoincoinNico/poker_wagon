class Card
  attr_reader :number, :color
  def initialize(number, color)
    @number, @color = number, color
  end

  def to_s
      case @number
      when 1..10
        value = "#{@number} of "
      when 11
        value = "Jack of "
      when 12
        value = "Queen of "
      when 13
        value = "King of "
      when 14
        value = "Ace of "
      end

      case @color
      when 1
        style = "spades"
      when 2
        style = "hearts"
      when 3
        style = "clubs"
      when 4
        style = "diamonds"
      end
      "#{value}#{style}"
  end

end