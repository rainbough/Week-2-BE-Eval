module Tennis
  class Game
    attr_accessor :player1, :player2

    # initializes new tennis game and creates two players
    #
    # designates player 1 as opponent of player 2
    # designates player 2 as opponent of player 1
    # 

    def initialize
      @player1 = Player.new
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
  end

  class Player
    attr_accessor :points, :opponent

    #initialize new player and sets points value of the player to 0

    def initialize
      @points = 0
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
    end
  end
end