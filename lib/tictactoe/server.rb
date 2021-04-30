# frozen_string_literal: true

# only require Sinatra when it's needed
require "sinatra/base"

module Tictactoe
  class Server < Sinatra::Application
    get "/game" do
      "hello world"
    end

    post "/game" do
      "yo"
    end
  end
end
