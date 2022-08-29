import java.util.Iterator;
import java.util.Scanner;

// Creates bingo tiles from numbers in a stream
public class BingoTileReader implements Iterator<BingoTile> {

    private Scanner source;

    public BingoTileReader(Scanner input) {
        this.source = input;
    }

    public boolean hasNext() {
        return source.hasNextInt();
    }

    public BingoTile next() {
        if (!hasNext()) {
            throw new java.util.NoSuchElementException();
        }
        return new BingoTile(source.nextInt());
    }

}
