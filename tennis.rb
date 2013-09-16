module Tennis
  class Game
    attr_accessor :player1, :player2

    #Internal: initializes new tennis game and creates two players. Designates player 1 as 
    #          opponent of player 2. Designates player 2 as opponent of player 1
    # 
    #Returns: A string of "Player 1:" followed by a new player object, then a string of 
    #         "Player 2:"followed by a new player object.
    def initialize
      puts "Player 1:"
      @player1 = Player.new
      puts "player 2:"
      @player2 = Player.new

      @player1.opponent = @player2
      @player2.opponent = @player1
    end

    #Internal: Sets won ball to player number passed in and increments points for that
    #          player by 1.
    #
    #
    #player_num - Each player is designated a number either '1' or '2' for the entire game. The number
    #             in integer form is passed in to the "wins_ball" method which then determines which
    #             player to call "record_won_ball!" on.
    #
    #example: game.wins_ball(1) would add 1 to player1.points.
    #
    #Returns: Returns the string "Please enter player number" if the integer 1 or 2 is not entered.

    
    def wins_ball(player_num)
      
      if player_num == 1
        player1.record_won_ball!
       
      elsif player_num == 2
        player2.record_won_ball!

      else
        puts "Please enter player number."
      end
    end

    #Internal: Checks to see if a points value passed in is greater than 2. If the 
    #points of either player exceed 2('thirty' in tennis-speak) by calling the thirty? method the end_game method is called
    #otherwise the message "keep playing" is returned.
    #
    #
    #
    def check_status
      if thirty?(@player1) || thirty?(@player2)
        self.end_game(@player1, @player2)
      else
        return "Keep playing!"
      end
    end

    #Internal: This method is used by the check_status method to determine if a player's score has
    #hit 'thirty'(2 points) yet.
    #
    #player - the player object is passed into this method. The method calls the player's point attribute
    #         to determine if it is equal or greater to two.
    def thirty?(player)
      if player.points >= 2 
        true
      else
        false
      end
    end

    #Internal: end_game is called from check status and implements the point system of the later part of the game.
    #
    #player1 - The player1 object
    #
    #player2 - The player2 object
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

    #Internal: initialize new player and sets points value of the player to 0

    def initialize
      @points = 0
      self.name
    end

    def name
      puts "Please enter the name of this player."
      @name = gets.chomp
    end

    #Internal: returns opponent variable for player. 
    def opponent
     @opponent
    end

    #Internal: Increments the score by 1. Returns the integer value of the new score.
    #
    # 
    def record_won_ball!
      @points += 1
    end

    #Internal: Returns the String score for the player.
    def score
      return 'love' if @points == 0
      return 'fifteen' if @points == 1
      return 'thirty' if @points == 2
      return 'forty' if @points == 3
      return "#{@points}" if @points > 3
    end

    #Internal: Retruns the name attributed of the player.
    def to_s
      "#{@name}"
    end
  end
end

