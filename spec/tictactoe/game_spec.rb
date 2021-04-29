# frozen_string_literal: true

RSpec.describe Tictactoe::Game do
  let(:a_game) { described_class.new }

  context "when started" do
    it "has an empty board" do
      empty_board = []

      expect(a_game.board).to eq(empty_board)
    end
  end

  describe "#turn" do
    it "places the token corresponding to the current player" do
      expected_token = a_game.current_player

      position = 2
      a_game.turn(position)

      expect(a_game.board[position]).to eq(expected_token)
    end

    context "when a token is already present" do
      specify do
        position = 2
        a_game.turn(position)

        expect { a_game.turn(position) }.to raise_error(Tictactoe::ErrTokenAlreadyPresent)
      end
    end

    context "when the position is negative" do
      specify do
        expect { a_game.turn(-1) }.to raise_error(Tictactoe::ErrTokenOutOfPosition)
      end
    end

    context "when the position is bigger than the board" do
      specify do
        expect { a_game.turn(described_class::BOARD_SIZE) }.to raise_error(Tictactoe::ErrTokenOutOfPosition)
      end
    end

    context "when the turn ends the game" do
      before do
        a_game.board = [
          nil, nil, "X",
          nil, "X", nil,
          nil, nil, nil
        ]
      end

      it "does not change the current player" do
        expect { a_game.turn(6) }.not_to change(a_game, :current_player)
      end
    end

    context "when the turn does not end the game" do
      before do
        a_game.board = [
          nil, nil, "X",
          nil, "X", nil,
          nil, nil, nil
        ]
      end

      it "changes the current player" do
        expect { a_game.turn(5) }.to change(a_game, :current_player).from("X").to("O")
      end
    end
  end

  describe "#won?" do
    subject { a_game.won? }

    context "when the board is empty" do
      it { is_expected.to be(false) }
    end

    context "when the game is not over" do
      before do
        a_game.board = [
          nil, "O", "X",
          nil, "O", nil,
          "X", nil, "X"
        ]
      end

      it { is_expected.to be(false) }
    end

    context "when a player won" do
      before do
        a_game.board = [
          nil, nil, "X",
          nil, "X", nil,
          "X", nil, nil
        ]
      end

      it { is_expected.to be(true) }
    end

    context "when the board is full but nobody won" do
      before do
        a_game.board = %w[
          X O X
          X O O
          O X X
        ]
      end

      it { is_expected.to be(false) }
    end
  end

  describe "#over?" do
    subject { a_game.over? }

    context "when the board is empty" do
      it { is_expected.to be(false) }
    end

    context "when the board is full" do
      before do
        a_game.board = %w[
          X O X
          X O O
          O X X
        ]
      end

      it { is_expected.to be(true) }
    end
  end
end
