require_relative 'tennis'

module Game
	class Game_play

		#sets the status of the current game to "new"
		def intialize
			current_game = Game.new
	  end

		#returns the string "We're playing tennis!"
		def to_s
			"We're playing tennis!"
		end

		#This method is called to start a new game. It asks whether the user would like
		#
		#to play a new game. If answer is 'y' it starts a new game. If 'n' it ends the program.
		#
		#It runs the method again if it does not receive a "y" or "n."
		def start
			puts "Would you like to play a new game (y or n)?"
			answer = gets.chomp.downcase
			unless answer == 'y' || answer == 'n' 
				puts "response not understood."
			end
			if answer == 'n'
				puts "Have a nice day."
			else
				puts "Great! You are Player1."
				self.coin_toss_call
			end
			
		end
	

		#Asks player to call heads or tails, saves response
		#
		def coin_toss_call
			puts "Please call 'heads' or 'tails'"
			call = gets.chomp.downcase
			unless call == 'heads' || call == 'tails'
				return 'response not understood'
				puts "resonse not understood. Hit 't' to try again."
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
				#call player2_serve
			elsif call != toss
				puts toss_string
				puts "you lost the coin toss."
				puts "Your opponent (Player2) will serve first."
				#call player1_serve
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
		def game_action
			random = rand(1..20)
			net_ball = rand(3..17)
			return "net"  if random == net_ball
			return "oob" if random <= 3
			return "hit" if random > 3 && random <=17
			return "miss" if random > 17
			
		end

		def hitter
		end

		def defense

		end

		#
		#
		def rally
			rally = current_game.game_action
			case rally
			when rally == "oob" 
				puts "#{hitter} hit the ball out of bounds"
				#defense wins_ball
				#return score
				#check game status
				#new serve switch servers

			when rally == "miss"
				puts "#{defender} missed the ball!"
				#hitter wins ball
				#return score
				#check game status
				#new server switch servers
			when rally == "net"
				puts "#{hitter} hit the net."
				#defender wins the ball
				#check game status
				#return score
				#new serve switch servers
			else rally == "hit"
				#switch hitter and defender
				current_game.rally
			end

		end
	
	end

end

game = Game::Game_play.new

game.start


