#include <iostream>
#include <vector>
#include <string>

using namespace std;



vector<int> inputValues () {
    // taking in user input
    vector<int> inputElements;
    string strInputElements;
    string userInput;

    cout << "Enter single digit numbers separated by commas: ";
    cin >> userInput;

    // parsing through input
    for (char value : userInput) {
        if (value != ',') {
            strInputElements.push_back(value);
            inputElements.push_back(value - '0');
        }
    }
    cout << "Your numbers are: [";
    for (int i = 0; i < inputElements.size(); i++) {
        cout << inputElements[i];
        if (i != inputElements.size() - 1) { cout << ", "; }
    }
    cout << "]" << endl;
    return inputElements;
}

void minimum(vector<int> inputElements) {
    // finding minimum number
    int minElement = inputElements.front();
    for (int i = 1; i < inputElements.size(); i++) {
        if (inputElements[i] < minElement) {
            minElement = inputElements[i];
        }
    }
    cout << "Minimum number is: " << minElement << endl;
}

void average(vector<int> inputElements) {
    // finding average number
    float total;
    for (int value : inputElements) {
        total += value;
    }
    float avgElement = total / inputElements.size();
    cout << "Average is: " << avgElement << endl;
}

int main() {
    // function calls
    vector<int> inputElements = inputValues();
    minimum(inputElements);
    average(inputElements);

    return 0;
}