#!/usr/bin/swift

for argument in CommandLine.arguments {
    switch argument {
    case "arg1":
        print("first argument");
    case "arg2":
        print("second argument");
    default:
        print("an argument \(argument)");
    }
}

