# frozen_string_literal: true

require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.setup

module Tictactoe
  class Error < StandardError; end

  class ErrTokenAlreadyPresent < Error; end

  class ErrTokenOutOfPosition < Error; end
end
