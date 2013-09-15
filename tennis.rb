module Tennis
  class Game
    attr_accessor :player1, :player2

    # initializes new tennis game and creates two players
    #
    # designates player 1 as opponent of player 2
    # designates player 2 as opponent of player 1
    # 

    def initialize
      puts "Player 1:"
      @player1 = Player.new
      puts "player 2:"
      @player2 = Player.new

      @player1.opponent = @player2
      @player2.opponent = @player1
    end

    #sets won ball to player number passed in and increments points for that player by 1
    #returns and error message if 1 or 2 is not passed in.
    #returns incremented score of player 
    #
    #e.g. game.wins_ball(1) would add 1 to player1.points.
    
    def wins_ball(player_num)
      
      if player_num == 1
        player1.record_won_ball!
       
      elsif player_num == 2
        player2.record_won_ball!

      else
        puts "Please enter player number."
      end
    end

    # sets variables for player1 points and player 2 points
    #
    # then passes these variables into the game_status method
    #
    # and returns game status
    def check_status
      if thirty?(@player1) || thirty?(@player2)
        self.end_game(@player1, @player2)
      else
        return "Keep playing!"
      end
    end

    #checks to see if a points value passed in is greater than 2.
    #if the points of either player exceed 2 the end_game method is called
    #otherwise the message "keep playing" is returned.
    #
    def thirty?(player)
      if player.points >= 2 
        true
      else
        false
      end
    end

    #end_game is called from check status and implements the point system of the later part of the game.
    #
    #

    def end_game(player1, player2)
   
      return "deuce" if player1.points == player2.points
      return "#{@player1} wins" if player1.points >= 4 && player1.points >= player2.points + 2
      return "#{@player2} wins" if player2.points >= 4 && player2.points >= player1.points + 2
      return "#{@player1}'s advantage" if player1.points > player2.points
      return "#{@player2}'s advantage" if player2.points > player1.points
  
    end
  end


  class Player
    attr_accessor :points, :opponent, :name

    #initialize new player and sets points value of the player to 0

    def initialize
      @points = 0
      self.name
    end

    def name
      puts "Please enter the name of this player."
      @name = gets.chomp
    end

    #returns opponent variable for player
    #expects opponent to be set by calling method
    def opponent
     @opponent
    end

    # Increments the score by 1.
    #
    # Returns the integer new score.
    def record_won_ball!
      @points += 1
    end

    # Returns the String score for the player.
    def score
      return 'love' if @points == 0
      return 'fifteen' if @points == 1
      return 'thirty' if @points == 2
      return 'forty' if @points == 3
      return "#{@points}" if @points > 3
    end

    # Retruns the string "Awesome tennis player"
    def to_s
      "#{@name}"
    end
  end
end