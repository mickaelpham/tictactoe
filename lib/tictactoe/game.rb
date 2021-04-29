# frozen_string_literal: true

module Tictactoe
  class Game
    BOARD_SIZE = 9

    attr_accessor :current_player
    attr_reader :board

    def initialize
      @board = []
      @current_player = "X"
    end

    def place_token(position)
      raise ErrTokenOutOfPosition if position.negative? || position >= BOARD_SIZE
      raise ErrTokenAlreadyPresent unless board[position].nil?

      board[position] = current_player
    end
  end
end
