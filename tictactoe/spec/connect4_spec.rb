require './connect4.rb'

describe "game" do
    it "puts at the bottom" do
        board = Connect4Board.new
        board.set(0, B)
        board.set(0, B)
        expect(board.board_config[1][0]).to eql(B)
    end

    it "find winner vertical" do
        board = Connect4Board.new
        board.set(0, B)
        board.set(0, B)
        board.set(0, B)
        board.set(0, B)

        expect(board.check_vertical?(0)).to eql(true)
    end

    it "find winner horizontal" do
        board = Connect4Board.new
        board.set(0, B)
        board.set(1, B)
        board.set(2, B)
        board.set(3, B)
        expect(board.check_horizontal?(0)).to eql(true)
    end

    it "find winner diagonal" do
        board = Connect4Board.new
        board.set(0, B)
        board.set(1, R)
        board.set(2, R)
        board.set(3, B)

        board.set(1, B)
        board.set(2, B)
        board.set(3, R)

        board.set(2, B)
        board.set(3, R)

        board.set(3, B)
        expect(board.check_horizontal?(0)).to eql(true)
    end
end