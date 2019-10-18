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

let randomOperations = ["+", "-", "/", "*"]
var randomPick = randomOperations.randomElement()!




// MAP FUNCTION
func customMap(arr: [Double], closure: (Double) -> Double) -> [Double] {
   var transformedArr = [Double]()
   for num in arr {
       transformedArr.append(closure(num))
   }
   return transformedArr
}

// FILTER FUNCTION
func filterFunc(arr:[Double], closure:(Double)-> Bool) -> [Double]{
    var filterResults = [Double]()
    for num in arr {
    if closure(num) {
        filterResults.append(num)
        }
    }
    return filterResults
}
        
// REDUCE FUNCTION
func reduceFunc(arr:[Double], closure:(Double) -> (Double)) -> Double {
    var reduceResults = 0.0
    for num in arr {
        reduceResults += num
}
    return reduceResults
}


print()


//======================================================================================
print("""
Welcome to David's Calculator! Using this calcuator, you will be able to perform Regular Functions and High Order Functions:

a) Regular Function:
    - Addition (+)
    - Subtraction (-)
    - Multiplication (*)
    - Division (/)
    - Random (will provide you with the output of a random operation) (?)

b) High Order Functions: Multiplying, dividing, or summing an array of a given group of numbers

""")
print("")
print("🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮🧮")
print("")
print("""
Please Enter the type of calculation you would like to perform:
Enter "a" for Regular Function
Enter "b" for High Order Function
""")


var userResponseArray = [String]()
let userResponseA = "a"
let userResponseB = "b"

var responseLoop = true
// switch userResponse {

//=======================================================================================================
repeat {
    
    let userResponseAorB = readLine()?.lowercased() ?? "" // choose a for Reg Func and b for High Order

    if userResponseAorB == userResponseA.lowercased() {
        print("Please enter your Regular Function Operation")
        let userNumbers = readLine() ?? ""
        userResponseArray = userNumbers.components(separatedBy: " ")
        if userResponseArray[1] == "?" {
            userResponseArray[1] = randomPick
            }
        let closureOperation = mathStuffFactory(opString: userResponseArray[1])
        let result = closureOperation(Double(userResponseArray[0]) ?? 0.0 , Double(userResponseArray[2]) ?? 0.0)
        print(result)
        
        if userResponseArray[1] == randomPick {  // user guessing ?
        let userGuess = randomPick
        repeat {
            print("Guess the operation for \"?\" ")
            let userGuess = readLine() ?? ""
            if userGuess == randomPick {
            print("Wow, you're smart!")
            } else {
            print("Please try again!")
                }
            } while userGuess != randomPick
        }
        
        
        print("Please press enter to go again!")
        responseLoop = true    // repeat the calculator
        
//=======================================================================================================
        
    } else if userResponseAorB == userResponseB {     // high order function
        print("""
        Please enter your High Order Function Operaiton
        Ex: filter 1,4,5,8,3,8,9 by > 8
        """)
        let userNumberB = readLine() ?? "Not a valid input"
        let userNumbersBArray = userNumberB.components(separatedBy: " ")
        let userNumBArrayIndex = userNumbersBArray[1].components(separatedBy: ",")
        let numBDouble = userNumBArrayIndex.map{Double($0) ?? 0}
        let numB = Double(userNumbersBArray[4]) ?? 0.0
        
        
        
        if userNumbersBArray[0] == "map" {
            switch userNumbersBArray[3] {
            case "*":
                let mapResult = customMap(arr: numBDouble, closure: {$0 * numB})
                print(mapResult)
            case "+":
                let mapResult = customMap(arr: numBDouble, closure: {$0 + numB})
                print(mapResult)
            case "-":
                let mapResult = customMap(arr: numBDouble, closure: {$0 - numB})
                print(mapResult)
            case "/":
                let mapResult = customMap(arr: numBDouble, closure: {$0 / numB})
                print(mapResult)
            default:
                print("Try again!")
            }
        } else if userNumbersBArray[0] == "filter" {
            switch userNumbersBArray[3] {
            case "<":
                let filterRes = filterFunc(arr: numBDouble, closure: {$0 < numB})
                print(filterRes)
            case ">":
                let filterRes = filterFunc(arr: numBDouble, closure: {$0 > numB})
                print(filterRes)
            default:
                print("Try again!")
            }
        } else if userNumbersBArray[0] == "reduce" {
            switch userNumbersBArray[3] {
            case "+":
                var reduceRes = reduceFunc(arr: numBDouble, closure: {$0 + numB})
            case "*":
                var reduceRes = reduceFunc(arr: numBDouble, closure: {$0 * numB})
            default:
                print("Try again!")
            }
        }
        
        
        
        
        
        
    

        
        //sperate second value in array based on commas and convert from an array of strings to ints
        // by > 4 // figure out the array/ location of > and 4
        // figure out higher order function ( use has prefix to figure out the higher order function
            // if else statement for map, filter, reduce.
        //filter operation > using a Filter
                            // switch >
                                // case
                                        // appropriate function
        
        
//=======================================================================================================
    } else {
        print("Please type a or b !")
    }
} while responseLoop
