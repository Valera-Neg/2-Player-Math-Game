require_relative 'question'
require_relative 'player'

class Game
  def initialize
    @player1 = Player.new('Player1')
    @player2 = Player.new('Player2')
    @players = [@player1, @player2]    
    @turn = 1 
  end

  def start
    gameOver = false
  
    until gameOver
      @question = Question.new()

      if @turn.odd?
        @currentPlayer = @players[0]
      else
        @currentPlayer = @players[1]
      end 

      puts "----- NEW TURN -----"
      puts @question.generatedQuestion(@currentPlayer.name)
      
      @answer = gets.chomp.to_i
      
      if @question.answerCheck?(@answer)
        puts 'Yes! You are correct.'
      else
        puts 'Seriously? No!'
        @currentPlayer.decrease_score
      end

      puts "P1: #{@players[0].score}/3 vs P2: #{@players[1].score}/3"
  
      @turn += 1;

      unless @currentPlayer.alive?
        gameOver = true

        if @turn.odd?
          winningPlayer = @players[0]
        else
          winningPlayer = @players[1]
        end
        
        puts "#{winningPlayer.name} wins with a score of #{winningPlayer.score}/3"
        puts "----- GAME OVER -----"
        puts "Good bye!"
      end
    end
  end
end