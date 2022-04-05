public class BingoTile {

    private final int number;
    private boolean marked;

    public BingoTile(int number) {
        this.number = number;
        clear();
    }

    public void clear() {
        marked = false;
    }

    public int getNumber() {
        return number;
    }

    public boolean isMarked() {
        return marked;
    }

    public boolean mark(int number) {
        if (this.number == number) {
            marked = true;
        }
        return isMarked();
    }
}
