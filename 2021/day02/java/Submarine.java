public abstract class Submarine {

    protected int depth = 0;
    protected int position = 0;

    public abstract void down(int amount);
    
    public abstract void forward(int amount);

    public int getDepth() {
        return depth;
    }

    public int getPosition() {
        return position;
    }

    public abstract void up(int amount);
    
}
