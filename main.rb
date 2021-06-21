# require 'pry'
require './game'
require './player'
require './question'

print "Enter Player 1 name: "
name1 = gets.chomp.to_s
print "Enter Player 2 name: "
name2 = gets.chomp.to_s
player1 = Player.new(name1)
player2 = Player.new(name2)

# set current player
game = Game.new(player1, player2)

while game.players[0].life > 0 and game.players[1].life > 0 do
  # create the q and a
  puts "--- NEW TURN ---"
  question = Question.new
  print "#{game.current_player.name}: #{question.gen_question}"
  answer = question.answer

  input = gets.chomp.to_i

  if (input != answer)
    game.substract_life
  end

  game.report_life

  game.change_player
end
