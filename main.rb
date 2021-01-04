require "./player.rb"


class Game_session
  def initialize
    @p1 = Player.new("Player 1")
    @p2 = Player.new("Player 2")

    @current_player = @p1

    number = 0
    @numbers = []

    while number < 21
      @numbers << number
      number += 1
    end

    @end_game = false

    puts "-----------------------"
    puts "----- GAME START! -----"
    puts "-----------------------"
  end

  def question
    x = @numbers.sample
    y = @numbers.sample
    answer = x + y

    puts "#{@current_player.name}: What does #{x} plus #{y} equal?"
    response = gets.chomp.to_i

    if response == answer
      puts "#{@current_player.name}: YES! You are correct. it's #{answer}."
    else
      @current_player.got_it_wrong
      puts "#{@current_player.name}: Seriously? No! it's #{answer}."
    end
  end

  def result
    #is the game over?
    if @current_player.lives === 0
      @end_game = true
    end

    #switch current player
    if @current_player === @p1
      @current_player = @p2
    else
      @current_player = @p1
    end

    if @end_game
      puts "#{@current_player.name} wins with #{@current_player.lives}/3"
      puts "----- GAME OVER -----"
      puts "Good bye!"
      exit
    else  
      puts "SCORE: P1: #{@p1.lives}/3 vs P2: #{@p2.lives}/3"
      puts "----- NEW TURN -----"
    end
  end 
end

game = Game_session.new

while true
  game.question
  game.result
end