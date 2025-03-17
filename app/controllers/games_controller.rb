class GamesController < ApplicationController
  def new
  end

  def create
    @player = Player.new(name: params[:player_name])
    @game = Game.create_with_player(player: @player)
    redirect_to game_path(@game)
  end

  def show
    @game = Game.find(params[:id])
  end
end
