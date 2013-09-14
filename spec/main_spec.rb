require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../main'

describe Game::Game_play do
  let(:game_play){Game::Game_play.new}

	describe 'initialize' do 
	
	end
	describe '#coin_toss_call' do
		it 'asks the reader to call a coin toss and saves the result' do
			call = 'h'

			expect(game_play.coin_toss_call).to eq("response not understood. Hit 't' to try again.")
		end
	end
	describe '#cointoss' do
		it 'uses a random number to simulate a coin toss' do
			number = 3

			expect(game_play.game_action).to eq('heads')
		end
	end
	describe '#toss_result' do
		it 'determines if the user won the coin toss' do
		end
	end

	describe '#game_action' do
		context 'When random is < 2' do
			it 'it returns out of bounds' do
				random = 1
				expect(game_play.game_action).to eq('oob')
			end
		end
			context 'When random is >= 2 & < 4' do
			it  'it returns opponent hits the ball' do
				random = 3
				expect(game_play.game_action).to eq('hit')

			end
		end
	end

end