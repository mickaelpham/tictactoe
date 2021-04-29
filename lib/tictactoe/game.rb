# frozen_string_literal: true

module Tictactoe
  class Game
    BOARD_SIZE = 9
    WIN_POSITIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ].freeze

    attr_accessor :current_player, :board

    def initialize
      @board = []
      @current_player = "X"
    end

    def won?
      WIN_POSITIONS.each do |positions|
        cells = board.values_at(*positions)

        return true if cells.all? { |token| token == current_player }
      end

      false
    end

    def place_token(position)
      raise ErrTokenOutOfPosition if position.negative? || position >= BOARD_SIZE
      raise ErrTokenAlreadyPresent unless board[position].nil?

      board[position] = current_player
    end
  end
end
