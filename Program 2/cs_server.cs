using System;
using System.IO;
using System.Reflection;
using System.Threading;

public class Program {
  private static StreamReader fifoReader;
  private static StreamWriter fifoWriter;
  private static Methods methods;
  private static BindingFlags flags;
  private static string clientName;
  private const char DELIM = '|';
  private static bool debugMode;

  public static void Main(string[] args) {
    debugMode = (args.Length > 0 && args[0].ToLower() == "debug");
    OpenFifo();
    methods = new Methods();
    flags = BindingFlags.Public | BindingFlags.Instance | BindingFlags.IgnoreCase;
    if (!debugMode) {
      while (true) {
        string msg = ReadFromFifo();
        if (string.IsNullOrEmpty(msg)) {
          continue;
        }
        else if (msg == "end") {
          CloseFifo();
          break;
        }
        else if (msg == "close") {
          CloseFifo();
          OpenFifo();
        }
        else if (msg.StartsWith("name")) {
          var parts = msg.Split(DELIM);
          clientName = parts[1].Trim();
          WriteToStdout("Connection found");
        }
        else {
          int? result = CallMethod(msg);
          WriteToFifo(result.Value.ToString());
        }
      }
    }
    else {
      while (true) {
        string msg = ReadFromFifo();
        msg = (msg == null ? "-ERROR-" : msg);
        if (msg == "") {
          WriteInfoToStdout("Why are you sending me an empty string? This may be harmless but I'm just letting you know.");
        }
        else if (msg == "-ERROR-") {
          WriteWarningToStdout("Something unexpected happened. Did you close the client connection without telling me? Server will restart now.");
          CloseFifo();
          OpenFifo();
        }
        else if (msg == "end") {
          WriteInfoToStdout("I received the message to end");
          CloseFifo();
          break;
        }
        else if (msg == "close") {
          WriteInfoToStdout("I received the message to close");
          CloseFifo();
          OpenFifo();
        }
        else if (msg.StartsWith("name")) {
          var parts = msg.Split(DELIM);
          if (parts.Length != 2) {
            WriteWarningToStdout($"I don't understand your name message. You sent me '{msg}'. The format should be 'name|C++' or 'name|Python'");
          }
          else {
            var nameValue = parts[1].Trim();
            if (nameValue.ToLower() != "c++" && nameValue.ToLower() != "python") {
              WriteWarningToStdout($"I only speak with C++ or Python not '{nameValue}'.");
            }
            else {
              WriteInfoToStdout($"Received name message from client. I'm talking with {nameValue}");
              clientName = nameValue;
            }
          }
        }
        else {
          if (string.IsNullOrEmpty(clientName)) {
            WriteWarningToStdout($"You sent me '{msg}' but I need your name first. You should send either 'name|C++' or 'name|Python' before sending other messages.");
          }
          else {
            int? result = CallMethod(msg);
            if (result == null) {
              WriteWarningToStdout($"I don't understand your message. You sent me '{msg}'. Double check for spelling mistakes like 'mult' instead of 'mul' and make sure you are sending two numbers.");
            }
            else {
              WriteInfoToStdout($"I just sent you a result of '{result}'.");
              WriteToFifo(result.Value.ToString());
            }
          }
        }
      }
    }
    WriteToStdout("Server closed");
  }

  private static void OpenFifo() {
    const string FIFO_PATH_SERVER_2_CLIENT = "/tmp/multi-lang-assignment-server2client";
    const string FIFO_PATH_CLIENT_2_SERVER = "/tmp/multi-lang-assignment-client2server";
    clientName = null;
    if (!File.Exists(FIFO_PATH_SERVER_2_CLIENT)) {
      var x = System.Diagnostics.Process.Start("mkfifo", FIFO_PATH_SERVER_2_CLIENT);
      if (x != null) {
        x.WaitForExit();
      }
    }
    if (!File.Exists(FIFO_PATH_CLIENT_2_SERVER)) {
      var x = System.Diagnostics.Process.Start("mkfifo", FIFO_PATH_CLIENT_2_SERVER);
      if (x != null) {
        x.WaitForExit();
      }
    }
    
    WriteToStdout("Waiting for new client connection...");
    FileStream fifoStream_Server2Client = new FileStream(FIFO_PATH_SERVER_2_CLIENT, FileMode.Open, FileAccess.ReadWrite, FileShare.ReadWrite);
    FileStream fifoStream_Client2Server = new FileStream(FIFO_PATH_CLIENT_2_SERVER, FileMode.Open, FileAccess.ReadWrite, FileShare.ReadWrite);
    fifoReader = new StreamReader(fifoStream_Client2Server);
    fifoWriter = new StreamWriter(fifoStream_Server2Client) { AutoFlush = true };
  }
  private static void CloseFifo() {
    WriteToStdout("Connection closed");
  }
  private static string ReadFromFifo() {
    Thread.Sleep(50);
    return fifoReader?.ReadLine()?.Trim().ToLower();
  }
  private static void WriteToFifo(string msg) {
    Thread.Sleep(50);
    fifoWriter.Write(msg + "\n");
  }
  private static void WriteToStdout(string msg) {
    Console.WriteLine($"\u001b[31mC#: {msg}\u001b[0m");
  }
  private static void WriteInfoToStdout(string msg) {
    Console.WriteLine($"\u001b[0mC#: {msg}\u001b[0m");
  }
  private static void WriteWarningToStdout(string msg) {
    Console.WriteLine($"\u001b[33mC#: \n*WARNING* {msg}\n\u001b[0m");
  }

  private static int? CallMethod(string msg) {
    var parts = msg.Split(DELIM);
    if (!debugMode) {
      string methodName = parts[0].Trim();
      var methodInfo = methods.GetType().GetMethod(methodName, flags);
      int param1 = int.Parse(parts[1].Trim());
      int param2 = int.Parse(parts[2].Trim());
      var returned = methodInfo.Invoke(methods, new object[]{param1, param2});
      WriteToStdout($"Honoring request from {clientName} of {methodName}({param1}, {param2})... Sending response");
      return int.Parse(returned.ToString());
    }
    else {
      if (parts.Length != 3) {
        WriteWarningToStdout($"Tried to call method but incorrect format found\nYou sent: '{msg}'\nCorrect examples include: 'add{DELIM}1{DELIM}2' and 'sub{DELIM}341{DELIM}56'\n");
        return null;
      }
      else {
        string methodName = parts[0].Trim();
        if (!int.TryParse(parts[1].Trim(), out int param1)) {
          WriteWarningToStdout($"Your first parameter '{parts[1]}' is not an integer");
          return null;
        }
        if (!int.TryParse(parts[2].Trim(), out int param2)) {
          WriteWarningToStdout($"Your second parameter '{parts[2]}' is not an integer");
          return null;
        }
        var methodInfo = methods.GetType().GetMethod(methodName, flags);
        if (methodInfo == null) {
          WriteWarningToStdout($"I don't understand what method you want me to call.\nYou sent: '{methodName}'\nValid methods are 'add', 'sub', 'mul', or 'div' only\n");
          return null;
        }
        var returned = methodInfo.Invoke(methods, new object[]{param1, param2});
        WriteToStdout($"Honoring request from {clientName} of {methodName}({param1}, {param2})... Sending response");
        return int.Parse(returned.ToString());
      }
    }
  }
}

public class Methods {
  public int Add(int x, int y) { return x + y; }
  public int Mul(int x, int y) { return x * y; }
  public int Sub(int x, int y) { return x - y; }
  public int Div(int x, int y) { return x / y; }
}
