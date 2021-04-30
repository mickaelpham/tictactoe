module Tictactoe
  class CLI
    attr_reader :game

    def initialize
      @game = Game.new
    end

    def run
      puts "Tic Tac Toe"

      until game.won? || game.over?
        begin
          display_grid
          game.turn(prompt_player)
        rescue Tictactoe::Error => e
          puts e
        end
      end

      display_grid

      if game.won?
        puts "Player #{game.current_player} won the game"
      else
        puts "Nobody won"
      end
    end

    private

    def prompt_player
      puts "It's #{game.current_player} turn. Where to play?"
      gets.chomp.to_i - 1
    end

    def display_grid
      game.board.each_with_index do |cell, i|
        if i % 3 == 0
          print "\n+---+---+---+\n|"
        end

        print " #{cell.nil? ? i + 1 : cell} |"
      end

      puts "\n+---+---+---+"
    end
  end
end
