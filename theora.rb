require 'rubygems'
require 'json'

scales = JSON.parse(open("scales.json").read)

loop do
  scale = scales.keys[rand(scales.size)]

  if rand(5) == 0
    puts "#{scale} scale!"
    STDIN.gets
  else
    position = rand(7)

    print "#{scale}, position #{position + 1}: "

    response = STDIN.gets

    if response.strip == scales[scale][position]
      puts "Right!"
    else
      puts "Wrong, #{scales[scale][position]}"
    end
  end
end