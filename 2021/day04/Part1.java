import java.util.Scanner;

public class Part1 {

    public static void main(String[] args) {
        var input = new Scanner(System.in);
        var game = new BingoGame(input);
        game.play();
        System.out.println(game.winningScore());
    }
    
}
