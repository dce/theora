class Note
  attr_accessor :name, :position

  def self.random
    new rand(21)
  end

  def initialize(pos = 1)
    @position = pos
  end

  def name
    names = ('A'..'G').to_a
    names = names.unshift(names.pop).reverse
    names[@position % 7]
  end

  def to_s
    clefs = "TREB  BASS"

    (0..20).map do |pos|
      out = if pos == 10
        "     -----"
      elsif pos % 2 == 0
        "---------------"
      else
        "#{clefs[pos / 2, 1]}     "
      end

      out[6, 3] = "( )" if pos == @position
      out
    end
  end
end
