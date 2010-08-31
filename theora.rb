require 'rubygems'
require 'json'

scales = JSON.parse(open("scales.json").read)
new_scales = {}

print "(s)cales, (n)otes, or (b)oth? "
questions = STDIN.gets.strip

loop do
  scale = scales.keys[rand(scales.size)]

  if questions == "s" || (questions == "b" && rand(5) == 0)
    flats = scales[scale].inject(0) {|sum, note| sum + (note =~ /\wb/ ? 1 : 0) }
    sharps = scales[scale].inject(0) {|sum, note| sum + (note =~ /\w#/ ? 1 : 0) }

    scale_string = scales[scale] * " "
    scale_string = "#{scale_string} (#{flats} flat#{"s" if flats > 1})" if flats > 0
    scale_string = "#{scale_string} (#{sharps} sharp#{"s" if sharps > 1})" if sharps > 0

    print "#{scale} scale!"
    STDIN.gets
    puts scale_string
    print "Did you get it? (y/n) "
    response = STDIN.gets.strip

    if response == "y"
      new_scales[scale] = scales.delete(scale)
      if scales.empty?
        scales = new_scales
        new_scales = {}
      end
    end
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