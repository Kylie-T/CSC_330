#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int main(int argc, char* argv[]) {

    // for messages from client to server
    ofstream writer("/tmp/multi-lang-assignment-client2server");

    // for messages from server to client
    ifstream reader("/tmp/multi-lang-assignment-server2client");
    string response;
    
    // tells the server which language is used
    writer << "name|C++\n";

    
    // sends and receives messages from the server
    writer << "add|80|400" << endl;
    getline(reader,response);
    cout << "\033[32m" << "C++: receiving response from C#, add(80, 400) = " << response << endl;

    writer << "mul|84|4" << endl;
    getline(reader,response);
    cout << "\033[32m" << "C++: receiving response from C#, mul(84, 4) = " << response << endl;

    writer << "add|8|4489" << endl;
    getline(reader,response);
    cout << "\033[32m" << "C++: receiving response from C#, sub(8, 4489) = " << response << endl;

    writer << "add|10|5" << endl;
    getline(reader,response);
    cout << "\033[32m" << "C++: receiving response from C#, div(8, 4) = " << response << endl;


    // checks if user wishes to end or close the server
    if (argc > 1 && string(argv[1]) == "end") { writer << "end\n"; }
    else { writer << "close\n"; }

    return 0;
}