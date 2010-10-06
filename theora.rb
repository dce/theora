require 'rubygems'
require 'json'
require 'scale'
require 'note'

scales = JSON.parse(open("scales.json").read)
new_scales = {}

print "(s)cales, (n)otes, s(t)aff, or (a)ll? "
questions = STDIN.gets.strip

loop do
  key = scales.keys[rand(scales.size)]
  scale = Scale.new(scales[key])

  if questions == "t" || (questions == "a" && rand(5) == 0)
    note = Note.random
    puts note.to_s
    print "\nNote: "
    response = STDIN.gets.strip

    puts response.downcase == note.name.downcase ? "Right!" : "Wrong, #{note.name}"
    sleep 1
  elsif questions == "s" || (questions == "a" && rand(5) == 1)
    print "#{key} scale!"
    STDIN.gets

    puts "#{scale}"
    print "Did you get it? (y/n) "
    response = STDIN.gets.strip

    if response == "y"
      new_scales[key] = scales.delete(key)

      if scales.empty?
        puts "Got 'em all!"
        scales, new_scales = new_scales, {}
      end
    end
  else
    position, note = scale.random_note
    print "#{key}, position #{position}: "
    response = STDIN.gets.strip

    puts response == note ? "Right!" : "Wrong, #{note}"
  end
end