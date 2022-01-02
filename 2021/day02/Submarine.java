public class Submarine {

    private int depth;
    private int position;

    public Submarine() {
        depth = 0;
        position = 0;
    }

    public void down(int amount) {
        depth += amount;
    }
    
    public void forward(int amount) {
        position += amount;
    }

    public int getDepth() {
        return depth;
    }

    public int getPosition() {
        return position;
    }

    public void up(int amount) {
        // make sure we don't go above sea level
        if (amount > depth) {
            depth = 0;
        } else {
            depth -= amount;
        }
    }
    
}
