require 'rubygems'
require 'json'

count = lambda do |notes, sym|
  notes.inject(0) do |sum, note|
    sum + (note.include?(sym) ? 1 : 0)
  end
end

scales = JSON.parse(open("scales.json").read)
new_scales = {}

print "(s)cales, (n)otes, or (b)oth? "
questions = STDIN.gets.strip

loop do
  key = scales.keys[rand(scales.size)]
  scale = scales[key]

  if questions == "s" || (questions == "b" && rand(5) == 0)
    flats, sharps = count[scale, "b"], count[scale, "#"]

    modifiers = if flats > 0
      " (#{flats} flat#{ "s" if flats > 1 })"
    elsif sharps > 0
      " (#{sharps} sharp#{ "s" if sharps > 1 })"
    end

    print "#{key} scale!"
    STDIN.gets

    puts "#{scale * " "}#{modifiers}"
    print "Did you get it? (y/n) "
    response = STDIN.gets.strip

    if response == "y"
      new_scales[key] = scales.delete(key)
      scales, new_scales = new_scales, {} if scales.empty?
    end
  else
    position = rand(7)
    print "#{key}, position #{position + 1}: "
    response = STDIN.gets.strip

    puts response == scale[position] ? "Right!" : "Wrong, #{scale[position]}"
  end
end