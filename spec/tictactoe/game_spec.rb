# frozen_string_literal: true

module Tictactoe
  RSpec.describe Game do
    let(:a_game) { described_class.new }

    context "when started" do
      it "has an empty board" do
        empty_board = []

        expect(a_game.board).to eq(empty_board)
      end
    end

    describe "#place_token" do
      it "adds a token at the given position" do
        position = 2
        a_game.place_token(position)

        expect(a_game.board[position]).not_to be_nil
      end

      it "places the token corresponding to the current player" do
        expected_token = "O"
        a_game.current_player = expected_token

        position = 2
        a_game.place_token(position)

        expect(a_game.board[position]).to eq(expected_token)
      end

      context "when a token is already present" do
        specify do
          position = 2
          a_game.place_token(position)

          expect { a_game.place_token(position) }.to raise_error(ErrTokenAlreadyPresent)
        end
      end

      context "when the position is negative" do
        specify do
          expect { a_game.place_token(-1) }.to raise_error(ErrTokenOutOfPosition)
        end
      end

      context "when the position is bigger than the board" do
        specify do
          expect { a_game.place_token(described_class::BOARD_SIZE) }.to raise_error(ErrTokenOutOfPosition)
        end
      end
    end

    describe "#won?" do
      context "when the board is empty" do
        it "returns false" do
          expect(a_game.won?).to be(false)
        end
      end

      context "when the game is not over" do
        before do
          a_game.board = [
            nil, "O", "X",
            nil, "O", nil,
            "X", nil, "X"
          ]
        end

        it "returns false" do
          expect(a_game.won?).to be(false)
        end
      end

      context "when a player won" do
        before do
          a_game.board = [
            nil, nil, "X",
            nil, "X", nil,
            "X", nil, nil
          ]
        end

        it "returns true" do
          expect(a_game.won?).to be(true)
        end
      end

      context "when the board is full but nobody won" do
        before do
          a_game.board = [
            "X", "O", "X",
            "X", "O", "O",
            "O", "X", "X"
          ]
        end

        it "returns false" do
          expect(a_game.won?).to be(false)
        end
      end
    end
  end
end
