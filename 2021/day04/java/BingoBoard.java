import java.util.Iterator;

public class BingoBoard {

    private final int boardSize;
    private BingoTile[] tiles;
    private BingoTile winningTile;

    // Fill new size*size board with tiles from source
    public BingoBoard(int size, Iterator<BingoTile> tileSource) {
        boardSize = size;
        tiles = new BingoTile[size * size];
        winningTile = null;
        for (int i = 0; i < tiles.length; i++) {
            tiles[i] = tileSource.next();
        }
    }

    // Mark first tile matching number and check for win
    public boolean mark(int number) {
        for (int row = 0; row < boardSize; row++) {
            for (int column = 0; column < boardSize; column++) {
                BingoTile tile = getTile(row, column);
                if (tile.mark(number) && checkWin(row, column)) {
                    // we have a winner
                    winningTile = tile;
                    return true;
                }
            }
        }
        // no winner yet
        return false;
    }

    // Clear all marked tiles
    public void reset() {
        for (var tile : tiles) {
            tile.clear();
        }
        winningTile = null;
    }

    // Get board score
    public int score() {
        if (win()) {
            return (unmarkedSum() * winningTile.getNumber());
        } else {
            return 0;
        }
    }
    
    // Do we have a winning board?
    public boolean win() {
        return (winningTile != null);
    }

    // Check for win in tile's row or column
    private boolean checkWin(int row, int column) {
        boolean rowWin = true, columnWin = true;
        for (int i = 0; i < boardSize; i++) {
            rowWin &= getTile(row, i).isMarked();
            columnWin &= getTile(i, column).isMarked();
        }
        return (rowWin || columnWin);
    }

    // Check if row or columnx index is within bounds
    private boolean invalidIndex(int index) {
        return (index < 0 || index >= boardSize);
    }

    // Get tile at specified location
    private BingoTile getTile(int row, int column) {
        if (invalidIndex(row) || invalidIndex(column)) {
            throw new IndexOutOfBoundsException();
        }
        return tiles[row * boardSize + column];
    }

    // Find sum of unmarked tiles
    private int unmarkedSum() {
        int sum = 0;
        for (BingoTile tile : tiles) {
            if (!tile.isMarked()) {
                sum += tile.getNumber();
            }
        }
        return sum;
    }

}
