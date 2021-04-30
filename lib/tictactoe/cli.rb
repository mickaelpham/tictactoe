# frozen_string_literal: true

module Tictactoe
  class CLI
    attr_reader :game

    def initialize
      @game = Game.new
    end

    def run
      puts "Tic Tac Toe"
      main_loop
      end_of_game
    rescue Interrupt
      puts "\nGame did not complete, see you soon"
    end

    private

    def main_loop
      until game.won? || game.over?
        begin
          display_grid
          game.turn(prompt_player)
        rescue Tictactoe::Error => e
          puts e
        end
      end
    end

    def prompt_player
      puts "It's #{game.current_player} turn. Where to play?"
      gets.chomp.to_i - 1
    end

    def display_grid
      game.board.each_with_index do |cell, i|
        print "\n+---+---+---+\n|" if (i % 3).zero?

        print " #{cell.nil? ? i + 1 : cell} |"
      end

      puts "\n+---+---+---+"
    end

    def end_of_game
      display_grid

      if game.won?
        puts "Player #{game.current_player} won the game"
      else
        puts "Nobody won"
      end
    end
  end
end
