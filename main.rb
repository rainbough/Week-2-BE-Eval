# require 'tennis.rb'

module Game
	class Game_play
		#sets the status of the current game to "new"
		def intialize
			@current_game = 'new'
	  	
		end
		#returns the string "We're playing tennis!"
		def to_s
			"We're playing tennis!"
		end

		#This method is called to start a new game. It asks whether the user would like
		#to play a new game. If answer is 'y' it starts a new game. If 'n' it ends the program.
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
		#If the number generated is less than or equal to five the method returns "heads".
		#If the random number is greater than 5 coin toss returns "tails."
		#
		def cointoss
			number = rand(1..10)
				return "heads" if number <= 5
				return "tails" if number > 5
		end

		def game_action
			random = rand(1..9)
			return "oob" if random <= 2
			return "hit" if random > 2 && random <=5
			return "net" if random > 5 && random <= 7
			return "miss" if random > 7

		end

		def volley
			unless random == "hit"

			end
		end

		def opponent_case
		end

		def player_case
		end
	
	end

end

game = Game::Game_play.new

game.start


