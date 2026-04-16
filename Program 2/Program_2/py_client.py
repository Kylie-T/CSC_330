import time
import sys

if __name__ == "__main__":
    math = ["add", "mul", "sub", "div"]
    
    # for messages from client to server
    with open("/tmp/multi-lang-assignment-client2server", 'w') as pipeWriter:
        # tells the server which language is used
        pipeWriter.write("name|Python\n")
        pipeWriter.flush()
        pipeWriter.close()

    for i in math:
        # client sends message to the server
        with open("/tmp/multi-lang-assignment-client2server", 'w') as pipeWriter:
            pipeWriter.write(f"{i}|6|3\n")
            pipeWriter.flush()
            pipeWriter.close()
        
        time.sleep(.5)
        # reads response from server and returns to client
        with open("/tmp/multi-lang-assignment-server2client", 'r') as pipeReader:      
            response = pipeReader.readline()
            pipeReader.close()
            print(f"\033[36mPython: receiving response from C#, {i}(6, 3) = {response}")
        time.sleep(.5)

    # check if user wishes to end or close the server
    if len(sys.argv) > 1 and sys.argv[1] == "end": 
        pipeWriter.write("end\n")
        pipeWriter.flush()
        pipeWriter.close()
    else: 
        with open("/tmp/multi-lang-assignment-client2server", 'w') as pipeWriter:
            pipeWriter.write("close\n")
            pipeWriter.flush()
            pipeWriter.close()
        