public class Submarine2 extends Submarine {

    private int aim = 0;

    public void down(int amount) {
        aim += amount;
    }
    
    public void forward(int amount) {
        position += amount;
        int targetDepth = depth + aim * amount;
        depth = Math.max(targetDepth, 0);
    }

    public void up(int amount) {
        aim -= amount;
    }
    
}
