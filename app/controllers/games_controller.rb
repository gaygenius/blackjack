class GamesController < ApplicationController
  def new
  end

  def create
    @player = Player.new(name: params[:player_name])
    @game_player = GamePlayer.create_with_player(player: @player)
    redirect_to game_path(@game_player)
  end

  def show
    @game_player = GamePlayer.find(params[:id])
  end

  def ante
    @game_player = GamePlayer.find(params[:id])
    @game_player.set_ante!(ante: params[:ante])
    redirect_to game_path(@game_player)
  end

  def hit
    @game_player = GamePlayer.find(params[:id])
    @game_player.hit!
    redirect_to game_path(@game_player)
  end
end
