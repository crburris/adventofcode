import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

class Part1 {

    private List<Integer> depths;

    public Part1(InputStream input) {
	depths = new ArrayList<>();
	Scanner inputScanner = new Scanner(input);
	while (inputScanner.hasNextLine()) {
	    String line = inputScanner.nextLine();
	    depths.add(Integer.valueOf(line));
	}
    }

    public void printSolution() {
	int countIncreases = 0;
	if (!depths.isEmpty()) {
	    int previousDepth = depths.get(0);
	    for (var nextDepth : depths) {
		if (nextDepth > previousDepth) {
		    countIncreases++;
		}
		previousDepth = nextDepth;
	    }
	}
	System.out.println(countIncreases);
    }
    
    public static void main(String[] args) {
	var solver = new Part1(System.in);
	solver.printSolution();
    }
    
}
