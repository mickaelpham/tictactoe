# frozen_string_literal: true

require "json"
require "sinatra/base"

module Tictactoe
  class Server < Sinatra::Application
    JSON_CONTENT_TYPE = { "Content-Type" => "application/json" }.freeze
    HTTP_OK = 200
    HTTP_NO_CONTENT = 204
    HTTP_UNPROCESSABLE_ENTITY = 422

    configure do
      set :game, Game.new
    end

    get "/game" do
      game = settings.game

      response = {
        board: game.board,
        current_player: game.current_player,
        won: game.won?,
        over: game.over?
      }

      [HTTP_OK, JSON_CONTENT_TYPE, response.to_json]
    end

    post "/game" do
      game = settings.game

      request.body.rewind
      data = JSON.parse(request.body.read, symbolize_names: true)

      game.turn(data[:position])
      HTTP_NO_CONTENT
    rescue Tictactoe::Error => e
      [HTTP_UNPROCESSABLE_ENTITY, JSON_CONTENT_TYPE, { error: e.to_s }.to_json]
    end
  end
end
