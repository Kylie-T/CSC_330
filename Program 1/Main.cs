using System;
using System.Collections.Generic;

class Project
{
    public static List<int> inputValues()
    {
        // taking in user input
        Console.Write("Enter single digit numbers separated by commas: ");
        string userInput = Console.ReadLine();

        // parsing through input
        List<int> inputElements = new List<int>();
        foreach (char value in userInput)
        {
            if (value != ',')
            { inputElements.Add(int.Parse(value.ToString())); }
        }
        Console.WriteLine($"Your numbers are: [{string.Join(", ", inputElements)}]");
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
        Console.WriteLine($"Minimum number is: {minElement}");
    }

    public static void average(List<int> inputElements)
    {
        // finding average number
        double total = 0;
        for (int i = 0; i < inputElements.Count; i++)
        { total += inputElements[i]; }
        double avgElement = total / inputElements.Count;
        Console.WriteLine($"Average is: {avgElement}");
    }

    static void Main()
    {
        // function calls
        List<int> inputElements = inputValues();
        minimum(inputElements);
        average(inputElements);
    }
}
