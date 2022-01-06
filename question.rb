class Question
  def initialize
    @value1 = rand(1..20)
    @value2 = rand(1..20)

    @sum = @value1 + @value2
  end

  def generatedQuestion(currentPlayer)
    "#{currentPlayer}: What does #{@value1} plus #{@value2} equal?"
  end

  def answerCheck?(answer)
    answer == @sum
  end
end