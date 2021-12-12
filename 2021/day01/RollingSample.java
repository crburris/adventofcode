public class RollingSample {
    
    private int[] elements;
    private int count, head;

    private int wrappedIndex(int index) {
	return (index % elements.length);
    }

    public RollingSample(int windowSize) {
	elements = new int[windowSize];
	count = 0;
	head = 0;
    }

    public void add(int elem) {
	elements[wrappedIndex(head + count)] = elem;
	if (count < elements.length) {
	    count++;
	} else {
	    head = wrappedIndex(head + 1);
	}
    }

    public boolean isFull() {
	return (count == elements.length);
    }

    public int sum() {
	int result = 0;
	for (int i = 0; i < count; i++) {
	    int datum = elements[wrappedIndex(head + i)];
	    result += datum;
	}
	return result;
    }
    
}
