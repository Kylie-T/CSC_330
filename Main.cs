using System;
using Console; 

class Main
{
    public static List<int> inputValues()
    {
        // taking in user input
        WriteLine("Enter single digit numbers separated by commas: ");
        string userInput = ReadLine();

        // parsing through input
        List<int> inputElements;
        foreach (char value in userInput)
        {
            if (value != ',')
            { inputElements.Add(value); }
        }
        WriteLine($"Your numbers are: [{String.join(", ", inputElements)}]");
        return inputElements;
    }

    public static void minimum(List<int> inputElements) 
    {   
        // finding minimum number
        int minElement = inputElements[0];
        for (int i = 1; i < inputElements.Count; i++)
        {
            if (inputElements[i] < minElement) { minElement = inputElements[i]; }
        }
        WriteLine($"Minimum number is: {minElement}");
    }

    public static void average(List<int> inputValues)
    {
        // finding average number
        float total = 0;
        for (int i = 1; i < inputElements.Count; i++)
        { total += inputElements[0]; }
        float avgElement = total / inputElements.Count;
        WriteLine($"Average is: {avgElement}");
    }

    static void Main()
    {
        // function calls
        List<int> inputElements = inputValues();
        minimum(inputElements);
        average(inputElements);
    }
}

Main newMain = new Main();