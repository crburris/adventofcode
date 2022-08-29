public class SubmarineController {

    // Execute movement commands of the form "INSTR ARG [ARGS...]"
    public void runCommand(String command, Submarine sub)
        throws SubmarineScriptException
    {
        // Parse command...
        String[] commandParts = command.split("\\s+");
        if (commandParts.length == 0) {
            // empty line, don't do anything
            return;
        } else if (commandParts.length < 2) {
            throw new SubmarineScriptException("Missing argument");
        }

        String instruction = commandParts[0].toLowerCase();
        
        int argument;
        try {
            argument = Integer.decode(commandParts[1]);
        } catch (NumberFormatException ex) {
            throw new SubmarineScriptException("Invalid argument");
        }
        
        // ...and execute it
        switch (instruction) {
        case "down":
            sub.down(argument);
            break;
        case "forward":
            sub.forward(argument);
            break;
        case "up":
            sub.up(argument);
            break;
        default:
            throw new SubmarineScriptException("Invalid instruction");
        }
    }
    
}
