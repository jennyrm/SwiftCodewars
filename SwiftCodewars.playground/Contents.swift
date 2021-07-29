import UIKit

///Given a string (written in English), return a tuple containing the number of vowels and consonants.(edited)
func numberOfVowelsAndConsonants(from string: String) -> (vowels: Int, consonants: Int) {
    var vowelsCount = 0
    var consonantsCount = 0
    let stringLowerCased = string.lowercased()
    
    stringLowerCased.forEach {
        if $0.isLetter {
            if $0 == "a" || $0 == "e" || $0 == "i" || $0 == "o" || $0 == "u" {
                vowelsCount += 1
            } else {
                consonantsCount += 1
            }
        }
    }
    
    return (vowels: vowelsCount, consonants: consonantsCount)
}

numberOfVowelsAndConsonants(from: "J.ENNY")

///The goal of this exercise is to convert a string to a new string where each character in the new string is "(" if that character appears only once in the original string, or ")" if that character appears more than once in the original string. Ignore capitalization when determining if a character is a duplicate.
//func duplicateEncode(_ word: String) -> String {
//    var convertedString = ""
////    word.filter {
//        if $0 != $1 {
//            convertedString.append("(")
//        } else {
//            convertedString.append(")")
//        }
//    }
//    return convertedString
//}

//Write a function that takes in a String, and returns that string with all duplicate letters removed. Parameter and return should be String

func removeDuplicateLetters(from string: String) -> String {
    
    let noDuplicatesDictionary = [String: Int]()
    
    string.forEach {
        print($0)
    }
    
    return ""
}


let str = "bookkeeper"
var set = Set<Character>()
let squeezed = str.filter{ set.insert($0).inserted }

print(squeezed)


///Multiplication table for number
func multi_table(_ number: Int) -> String {
    var multiplicationTable = ""
    
    for num in 1...10 {
        multiplicationTable.append("\(num) * \(number) = \(num * number)\(num != 10 ? "\n" : "")")
    }
    
    return multiplicationTable
}

multi_table(5)

/**An ordered sequence of numbers from 1 to N is given. One number might have deleted from it, then the remaining numbers were mixed. Find the number that was deleted.
 
 Example:
 
 The starting array sequence is [1,2,3,4,5,6,7,8,9]
 The mixed array with one deleted number is [3,2,4,6,7,8,1,9]
 Your function should return the int 5.
 If no number was deleted from the array and no difference with it, your function should return the int 0.
 
 Note: N may be 1 or less (in the latter case, the first array will be []).*/

func findDeletedNumber(_ array: [Int], _ mixArray: [Int]) -> Int {
    let sortedMixedArr = mixArray.sorted(by: <)
    var deletedNumber = 0
    
    if array.count != sortedMixedArr.count {
        for i in 0..<array.count {
            if array[i] != sortedMixedArr[i] {
                deletedNumber = array[i]
                return deletedNumber
            }
        }
    }
    
    return deletedNumber
}

findDeletedNumber([1,2,3,4,5,6,7,8,9], [3,2,4,6,7,8,1,9])

/**Usually when you buy something, you're asked whether your credit card number, phone number or answer to your most secret question is still correct. However, since someone could look over your shoulder, you don't want that shown on your screen. Instead, we mask it.
 
 Your task is to write a function maskify, which changes all but the last four characters into '#'.*/

func maskify(_ string:String) -> String {
    
    var maskedString = ""
    
    for (index, letter) in string.enumerated() {
        index < string.count - 4 ? maskedString.append("#") : maskedString.append(letter)
    }
    
    return maskedString
}

maskify("Skippy")
maskify("Nananananananananananananananana Batman!")

/**This time no story, no theory. The examples below show you how to write function accum:
 
 Examples:
 accum("abcd") -> "A-Bb-Ccc-Dddd"
 accum("RqaEzty") -> "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
 accum("cwAt") -> "C-Ww-Aaa-Tttt"*/

func accum(_ s: String) -> String {
    
    var accumString = ""
    
    for (index, character) in s.enumerated() {
        for i in 0...index {
            i == 0 ? accumString.append("\(character.uppercased())") : accumString.append("\(character.lowercased())")
        }
        index == s.count - 1 ? accumString.append("") : accumString.append("-")
    }
    
    return accumString
}

accum("abcd")
accum("RqaEzty")
accum("cwAt")
