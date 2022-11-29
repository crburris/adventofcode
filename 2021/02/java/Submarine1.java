public class Submarine1 extends Submarine {

    public void down(int amount) {
        depth += amount;
    }
    
    public void forward(int amount) {
        position += amount;
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
