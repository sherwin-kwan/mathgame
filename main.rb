require './Game'
require './Player'

puts "Welcome to Mathgame! Choose easy (e) or hard (h) difficulty: "
print "> "
diff = $stdin.gets.chomp
Game.new(diff)