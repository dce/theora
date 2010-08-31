require 'rubygems'
require 'json'

scales = JSON.parse(open("scales.json").read)

print "(s)cales, (n)otes, or (b)oth? "
questions = STDIN.gets.strip

loop do
  scale = scales.keys[rand(scales.size)]

  if questions == "s" || (questions == "b" && rand(5) == 0)
    print "#{scale} scale!"
    STDIN.gets
    puts scales[scale] * " "
  else
    position = rand(7)

    print "#{scale}, position #{position + 1}: "

    response = STDIN.gets.strip

    if response == scales[scale][position]
      puts "Right!"
    else
      puts "Wrong, #{scales[scale][position]}"
    end
  end
end