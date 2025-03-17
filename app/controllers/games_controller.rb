class GamesController < ApplicationController
  def play
  end

  def start
    Rails.logger.info "Start action params: #{params.inspect}"
  end
end
