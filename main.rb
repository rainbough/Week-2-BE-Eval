require_relative 'tennis'

module Controller
	class Game_play

		#Creates a new game method.
		def initialize
			@current_game = Tennis::Game.new
			@player1 = @current_game.player1
			@player2 = @current_game.player2
			self.coin_toss_call
	  end

		#returns the string "We're playing tennis!"
		def to_s
			"We're playing tennis!"
		end

		#This method is called to start a new game. It asks whether the user would like
		#
		#to play a new game. If answer is 'y' it starts a new game. If 'n' it ends the program.
		#
		#It prints "response not understood" if any other response is received.
		def new_game
			puts "Would you like to play a new game (y or n)?"
			answer = gets.chomp.downcase
			if answer == 'y'
				@player1.points = 0
				@player2.points = 0
				puts "Player 1 = #{@player1}"
				puts "player 2 = #{@player2}"
				self.coin_toss_call
			elsif answer 
				puts "Have a nice day."
			else
				puts "response not understood."
			end
			
		end

		def start
			
			
		end
	

		#Asks player to call heads or tails, saves response
		#
		def coin_toss_call
			puts "Please call 'heads' or 'tails'"
			call = gets.chomp.downcase
			unless call == 'heads' || call == 'tails'
				puts "response not understood. Hit 't' to try again."
				response = gets.chomp.downcase
				if response == "t"
					self.coin_toss_call
				else
					puts "exiting game."
				end
			else
				self.toss_results(call)
			end
		end

		#toss results takes a call as argument passes it to the results of a call to the cointoss method
		#
		#then determines a winner of the toss
		def toss_results(call)
			toss = self.cointoss
			toss_string ="you called #{call} and the toss returned #{toss}."
			if call ==  toss
				puts toss_string
				puts "you won the coin toss."
				puts "You get to serve first."
				puts "											"
				$hitter = @player1
				$hit_num = 1
				$defender = @player2
				$def_num = 2
				server(@player1)
			elsif call != toss
				puts toss_string
				puts "you lost the coin toss."
				puts "#{@player2} will serve first."
				puts "													"
				$hitter = @player2
				$hit_num = 2
				$defender = @player1
				$def_num = 1
				server(@player2)
			else
				"error"
			end
		end

		#cointoss generates a random number between 1 and 10 and saves it in the 'number' variable.
		#
		#If the number generated is less than or equal to five the method returns "heads".
		#
		#If the random number is greater than 5 coin toss returns "tails."
		#
		def cointoss
			number = rand(1..10)
				return "heads" if number <= 5
				return "tails" if number > 5
		end

		#game action uses a random number to determine the result of ball serves.
		#
		#a random number between 5 and 15 is set as a net ball meaning the ball is
		# 
		#stopped by the net and does not make it to the other court
		def game_action(num)
			
			net_ball = rand(5..15)
			return "net"  if num == net_ball
			return "oob" if num <= 3
			return "hit" if num > 3 && num <=17
			return "miss" if num > 17
		end

		#This method switches which player is the hitter and which is returning the ball
		#
		#Once a player hits the ball they become the "hitter" and the other player becomes 
		#
		#the defender. It also associates player number with "hitter" and "defender" so that 
		#the score can be tracked.
		def hitter(hitter)
			if $hitter == @player1
				$hitter = @player2
				$hit_num = 2
				$defender = @player1
				$def_num = 1
				self.rally
			else 
				$hitter = @player1
				$hit_num = 1
				$defender = @player2
				$def_num = 2
				self.rally
			end
		end


		#This method sets the first server of a new game.
		#It sets it to which ever player is passed to it.
		def server(player)
			$server = player
			new_serve($server)
		end

		#This method initiates a new serve and calls the rally method.
		def new_serve(server)
			puts "  "
			puts ">>>>>>>>>>>>> #{$hitter} serves the ball >>>>>>>>>>>>>>>"
			puts "hit any letter to continue 'q' to quit."
			puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
			result = gets.chomp.downcase
			
			if result == 'q'
		  	puts "exiting game"

			else
				self.rally
			end
		end

		#This method alternates which player is the server and then passes the new
		#server to the new_serve method.
		def switch_serve(server)
			if @current_game.check_status == "#{@player1} wins" ||  @current_game.check_status == "#{@player2} wins"
				self.new_game
			else
				if $server == @player1
					$server = @player2
					$hitter = @player2
					$hit_num =  2
					$defender = @player1
					$def_num = 1
				else
					$server = @player1
					$hitter = @player1
					$hit_num = 1
					$defender = @player2
					$def_num = 2
				end
				new_serve($server)
			end
		end

		#This is the main action of the game
		#
		# rally calls the game_action method to determine what has happened to the ball
		# then it uses a case statement to return results and pick next actions
		#
		def rally
			num = rand(1..20)
			rally = game_action(num)
			case rally
				when "oob" 
					puts "oo-oo-oo-oo-oo #{$hitter} hit the ball out of bounds oo-oo-oo-oo-oo"
					@current_game.wins_ball($def_num)
					puts "Game Status: #{@current_game.check_status}"
					puts "#{@player1}'s score: #{@player1.score} | #{@player2}'s score: #{@player2.score}"
					switch_serve($server)
				when "miss"
					puts "mmmmmmm #{$defender} missed the ball! mmmmmmmmmm"
					@current_game.wins_ball($hit_num)
					puts "Game Status: #{@current_game.check_status}"
					puts "#{@player1}'s score: #{@player1.score} | #{@player2}'s score: #{@player2.score}"
					switch_serve($server)

				when "net"
					puts "############ #{$hitter} hit the net. ############"
					@current_game.wins_ball($def_num)
					puts "Game Status: #{@current_game.check_status}"
					puts "#{@player1}'s score: #{@player1.score} | #{@player2}'s score: #{@player2.score}"
					switch_serve($server)
				when "hit"
					puts "^o^o^o^o^o^ #{$defender} returns the ball ^o^o^o^o^o^"
					puts "     "
					hitter($hitter)
			
				else
					puts "#{rally} Error!!!"
				end
				
				
			end

		
	
	end

end

game = Controller::Game_play.new


