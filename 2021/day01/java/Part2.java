import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

class Part2 {

    private List<Integer> depths;

    public Part2(InputStream input) {
	depths = new ArrayList<>();
	Scanner inputScanner = new Scanner(input);
	while (inputScanner.hasNextLine()) {
	    String line = inputScanner.nextLine();
	    depths.add(Integer.valueOf(line));
	}
    }

    private List<Integer> sampleSums() {
	var sums = new ArrayList<Integer>();
	var sample = new RollingSample(3);
	var depthsIter = depths.iterator();
	while (!sample.isFull() && depthsIter.hasNext()) {
	    sample.add(depthsIter.next());
	}
	if (sample.isFull()) {
	    sums.add(sample.sum());
	}
	while (depthsIter.hasNext()) {
	    sample.add(depthsIter.next());
	    sums.add(sample.sum());
	}
	return sums;
    }

    public void printSolution() {
	int countIncreases = 0;
	var sums = sampleSums();
	if (!sums.isEmpty()) {
	    int previousSum = sums.get(0);
	    for (var nextSum : sums) {
		if (nextSum > previousSum) {
		    countIncreases++;
		}
		previousSum = nextSum;
	    }
	}
	System.out.println(countIncreases);
    }
    
    public static void main(String[] args) {
	var solver = new Part2(System.in);
	solver.printSolution();
    }
    
}
