# require 'tennis.rb'

module Game
	class Game_play

		def intialize
			@current_game = 'new'
	  	
		end
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

		def toss_results(call)
			toss = self.cointoss
			toss_string ="you called #{call} and the toss returned #{toss}."
			if call ==  toss
				puts toss_string
				puts "you won the coin toss."
			elsif call != toss
				puts toss_string
				puts "you lost the coin toss."
			else
				"error"
			end
		end

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


