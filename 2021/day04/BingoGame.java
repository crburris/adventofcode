import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class BingoGame {

    private List<BingoBoard> boards;
    private List<Integer> draws;
    private BingoBoard winningBoard;

    public BingoGame(Scanner input) {
        // Read comma-delimited draw order from first line of input
        draws = new ArrayList<Integer>();
        String drawsLine = input.nextLine();
        for (String draw : drawsLine.split(",")) {
            draws.add(Integer.parseInt(draw));
        }

        // Read bingo boards from rest of input
        boards = new ArrayList<BingoBoard>();
        var tileReader = new BingoTileReader(input);
        while (input.hasNext()) {
            boards.add(new BingoBoard(5, tileReader));
        }

        winningBoard = null;
    }

    // Play the game until someone wins or we run out of numbers
    public boolean play() {
        var drawIter = draws.iterator();
        while (winningBoard == null && drawIter.hasNext()) {
            int draw = drawIter.next();
            for (BingoBoard board : boards) {
                if (board.mark(draw)) {
                    // we have a winner
                    winningBoard = board;
                    return true;
                }
            }
        }
        // everyone loses
        return false;
    }

    // Reset all boards
    public void reset() {
        for (var board : boards) {
            board.reset();
        }
        winningBoard = null;
    }

    // Return score of winning board, or 0 if no winner yet
    public int winningScore() {
        if (winningBoard != null) {
            return winningBoard.score();
        } else {
            return 0;
        }
    }

}
