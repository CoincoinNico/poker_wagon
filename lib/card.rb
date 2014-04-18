class Card
  attr_reader :number, :color
  def initialize(number, color)
    @number, @color = number, color
  end

  def to_s
      case @number
      when 1..10
        value = "#{@number}"
      when 11
        value = "Jack"
      when 12
        value = "Queen"
      when 13
        value = "King"
      when 14
        value = "Ace"
      end

      case @color
      when 1
        style = "\u2660"
      when 2
        style = "\u2665"
      when 3
        style = "\u2663"
      when 4
        style = "\u2662"
      end
      "#{value}#{style}"
  end

end