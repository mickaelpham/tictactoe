# frozen_string_literal: true

require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect("cli" => "CLI")
loader.setup

module Tictactoe
  class Error < StandardError; end

  class ErrTokenAlreadyPresent < Error
    def to_s
      "A token is already present at the position"
    end
  end

  class ErrTokenOutOfPosition < Error
    def to_s
      "That position is incorrect (out of the board)"
    end
  end
end
