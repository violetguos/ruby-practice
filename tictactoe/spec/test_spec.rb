require './main.rb'

describe "board" do
    it "dimension is 3" do
        board = Board.new

        expect(board.dim).to eql(3)
    end
end
  
describe "game" do
    it "detects horizontal" do
        board = Board.new
        board.set([0, 0], "x")
        board.set([1, 1], "x")
        board.set([2, 2], "x")
        expect(board.check_diagonal?()).to eql(true)
    end

    it "detects horizontal" do
        board = Board.new
        board.set([0, 0], "x")
        board.set([0, 1], "x")
        board.set([0, 2], "x")
        expect(board.check_horizontal?(0)).to eql(true)
    end

    it "detects horizontal" do
        board = Board.new
        board.set([1, 0], "x")
        board.set([2, 0], "x")
        board.set([0, 0], "x")
        expect(board.check_vertical?(0)).to eql(true)
    end
end
