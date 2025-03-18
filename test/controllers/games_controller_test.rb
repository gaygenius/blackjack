require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_game_url
    assert_response :success
  end

  test "should create game" do
    assert_difference('Player.count') do
      assert_difference('GamePlayer.count') do
        post games_url, params: { player_name: 'John Doe', ante: 100 }
      end
    end
    assert_redirected_to game_path(GamePlayer.last)
  end

  test "should show game" do
    game_player = game_players(:one)
    get game_url(game_player)
    assert_response :success
  end
end
