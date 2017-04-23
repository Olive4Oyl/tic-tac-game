class GamesController < ApplicationController

	def index
		@games = Game.all
		render json: @games
	end

	def create
		@game = Game.create(state: params[:state])
		redirect_to "/"
  	end

  	def show
  		@game = Game.find_by(id: params[:id])
  		render json: @game
  	end

  	def update
		@game = Game.find(params[:id])
  		@game.update(state: params[:game][:state])
  	end

  	def board
  		@game = Game.find(params[:id])
  		render json: [@game.state, @game.id]
  	end

end
