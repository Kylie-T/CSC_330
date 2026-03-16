import java.util.Scanner;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        // function calls
        ArrayList<Integer> inputElements = inputValues();
        minimum(inputElements);
        average(inputElements);
    }

    public static ArrayList<Integer> inputValues() {
        // taking in user input
        String elements = "[";
        ArrayList<Integer> inputElements = new ArrayList<>();
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter single digit numbers separated by commas: ");
        String userInput = scanner.nextLine();
        scanner.close();

        // parsing through input
        for (int i = 0; i < userInput.length(); i++) {
            if (userInput.charAt(i) != ',') {
                int number = Character.getNumericValue(userInput.charAt(i));
                inputElements.add(number);
                elements = elements + String.valueOf(number);
                if (i < userInput.length() - 2){
                    elements = elements + ", ";
                }
            }
        }
        System.out.println(elements + "]");
        return inputElements;
    }

    public static void minimum(ArrayList<Integer> inputElements) {
        // finding minimum number
        int minElement = inputElements.get(0);
        for (int i = 1; i < inputElements.size(); i++) {
            if (inputElements.get(i) < minElement) {
                minElement = inputElements.get(i);
            }
        }
        System.out.println("Minimum number is: " + minElement);
    }

    public static void average(ArrayList<Integer> inputElements) {
        // finding average number
        float total = 0;
        for (int i = 0; i < inputElements.size(); i++) {
            total = total + inputElements.get(i);
        }
        float avgElement = (total / inputElements.size());
        System.out.println("Average is: " + avgElement);
    }
}