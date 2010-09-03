class Scale
  def initialize(notes)
    @notes = notes
  end

  def key_signature
    %w(# b).each do |sym|
      note_count = count(sym)
      return "#{note_count}#{sym}" if note_count > 0
    end

    nil
  end

  def key_signature_string
    if key_signature
      names = { "#" => "sharp", "b" => "flat" }
      note_count, sym = key_signature.split('')
      " (#{ pluralize(note_count, names[sym]) })"
    end
  end

  def to_s
    "#{ @notes * " " }#{ key_signature_string }"
  end

  def note(position)
    @notes[position - 1]
  end

  def random_note
    position = rand(7) + 1
    [position, note(position)]
  end

  private

  def count(sym)
    @notes.inject(0) do |sum, note|
      sum + (note.include?(sym) ? 1 : 0)
    end
  end

  def pluralize(count, word)
    "#{count} #{word}#{"s" unless count == 1}"
  end
end