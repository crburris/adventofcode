import java.util.Scanner;

public class Part2 {

    public static void main(String[] args) {
        var report = new DiagnosticReport();
        Scanner input = new Scanner(System.in);
        while (input.hasNext()) {
            String line = input.nextLine();
            report.add(Integer.parseInt(line, 2));
        }
	System.out.println(report.lifeSupportRating());
    }
    
}
