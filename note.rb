class Note
  attr_accessor :name, :position

  def self.random
    new rand(22)
  end

  def initialize(pos = 0)
    @position = pos
  end

  def name
    ('A'..'G').to_a.reverse[@position % 7]
  end

  def to_s
    clefs = " TREB  BASS "

    (0..21).map do |pos|
      out = if pos == 11
        "     -----"
      elsif pos % 2 == 1
        "---------------"
      else
        "#{clefs[pos / 2, 1]}     "
      end

      out[6, 3] = "( )" if pos == @position
      out
    end
  end
end
