// This program reads information from line,
// it uses recursion to reverse a string.

//
//  Created by Sarah Andrew

//  Created on 2023-03-04

//  Version 1.0

//  Copyright (c) 2023 Sarah. All rights reserved.
import Foundation

// Define input & output paths.
let inputFile = "input.txt"
let outputFile = "output.txt"

// Usage of file handle method to locate files,
// as well as opening input for file reading.
do {
    // Open input file for reading.
    guard let input = FileHandle(forReadingAtPath: inputFile) else {
        print("Error: cannot access input file for opening.")
        exit(1)
    }

    // Open output file for writing.
    guard let output = FileHandle(forWritingAtPath: outputFile) else {
        print("Error: cannot access output file for opening.")
        exit(1)
    }

    // Read context for file.
    let inputData = input.readDataToEndOfFile()

    // Convert data to a string.
    guard let inputString = String(data: inputData, encoding: .utf8) else {
        print("Error: Cannot convert input data to string.")
        exit(1)
    }

    // Split string into lines, ensuring reading empty line.
    let inputLines = inputString.components(separatedBy: .newlines)

    // Usage of loop to access each element.
    for str in inputLines {
        if let aNum = Double(str) { 
            // Call function.
            let recFactorial = recFactorial(aNum: aNum)
            // Display to user & write to console.
            print("The factorial of", str, terminator: "")
            print(" is", recFactorial)

            let data1 = Data(("The factorial of " + str + "\n").utf8)
            output.write(data1)
            let data2 = Data((" is " + String(recFactorial) + "\n").utf8)
            output.write(data2)
        } else {
            print("Please enter valid input.")
        }

    }

    // Close input & output file.
    input.closeFile()
    output.closeFile()

}
// This function uses recursion to
// calculate the factorial of numbers.
func recFactorial(aNum: Double) -> Double {
    // Calculates factorial.
    if aNum == 0 {
        // Return to main
        return 1
    } else {
        // Calls function recursively.
        return aNum * recFactorial(aNum: aNum - 1)
    }
}
