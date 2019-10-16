//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

/*
 1. We need calculator to perform full equations with 2 input numbers and operation
 2. Be able to identify unknown operators
 3. Make ? perform random operation ( +, -, /, *, ?)
 4. When using the ?, the applicaiyon will perform operation, giving you answer without operation
 5. Be able to guess the random operation and have application tell you if its true or false
 Use filter, map, and reduce
 filters Ints only: numbers less than a give number/ numbers greater than a given number
2b. Implement own map
 2c. Implement your own reduce function
 */


/*
  Option for high order function (reduce, map) or low order (basic operations)
 
 let user input a readline function (string)
 convert string into array
 loop in array to find operation ( +, -, /, *, or ?)
 - if operation is not there, error message
 */

//======================================================================================


func mathStuffFactory(opString: String) -> (Double, Double) -> Double {
  switch opString {
  case "+":
    return {x, y in x + y }
  case "-":
    return {x, y in x - y }
  case "*":
    return {x, y in x * y }
  case "/":
    return {x, y in x / y }
  default:
    return {x, y in x + y }
  }
}

let closureOperation = mathStuffFactory(opString: "+")
let result = closureOperation(45 , 5)



//======================================================================================
print("""
Welcome to David's Calculator! Using this calcuation, you will be able to perform High Order Functions and Regular Functions:
1. High Order Functions: Multiplying, dividing, or summing an array of a given group of numbers
2. Regular Function:
    - Addition (+)
    - Subtraction (-)
    - Multiplication (*)
    - Division (/)
    - Random (will provide you with the output of a random operation) (?)

""")
print("")
print("🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮")
print("")
print("""
Please Enter the type of calculation you would like to perform:
Enter "a" for Regular Function
Enter "b" for High Order Function
""")

var userResponse = readLine() ?? ""
var userNumbers = readLine() ?? ""
var userResponseArray = [String]()
let userResponseOne = "a"
let userResponseTwo = "b"


// switch userResponse {


repeat {
    if userResponse == userResponseOne {
        print("Please enter your Regular Function Operation")
        userNumbers = readLine() ?? ""
        userResponseArray = userNumbers.components(separatedBy: " ")
        let closureOperation = mathStuffFactory(opString: userResponseArray[1])
        let result = closureOperation(Double(userResponseArray[0]) ?? 0.0 , Double(userResponseArray[2]) ?? 0.0)
        print(result)
        
    } else if  userResponse == userResponseTwo {
        print("Please enter your High Order Function Operaiton")
        
        

        
        
        
        
        
    } else {
        print("Please type a or b !")
        userResponse = readLine() ?? "a"
    }
} while userResponse != userResponseOne && userResponse != userResponseTwo
