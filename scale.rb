class Scale
  def initialize(notes)
    @notes = notes
  end

  def key_signature
    { "sharp" => "#", "flat" => "b" }.each do |name, sym|
      note_count = count(sym)
      return [note_count, name] if note_count > 0
    end
  end

  def to_s
    "#{ @notes * " " }#{ " (#{ pluralize(*key_signature) })" if key_signature }"
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