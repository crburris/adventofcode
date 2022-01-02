public class Part1 {

    public static void main(String[] args)
        throws SubmarineScriptException
    {
        var sub = new Submarine();
        var driver = new SubmarineController();
        var input = new java.util.Scanner(System.in);
        while (input.hasNext()) {
            String command = input.nextLine();
            driver.runCommand(command, sub);
        }
        
        System.out.println(sub.getPosition() * sub.getDepth());
    }
    
}
