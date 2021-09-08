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

//numberOfVowelsAndConsonants(from: "J.ENNY")

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
    
    _ = [String: Int]()
    
    string.forEach {
        print($0)
    }
    
    return ""
}


//let str = "bookkeeper"
//var set = Set<Character>()
//let squeezed = str.filter{ set.insert($0).inserted }

//print(squeezed)


///Multiplication table for number
func multi_table(_ number: Int) -> String {
    var multiplicationTable = ""
    
    for num in 1...10 {
        multiplicationTable.append("\(num) * \(number) = \(num * number)\(num != 10 ? "\n" : "")")
    }
    
    return multiplicationTable
}

//multi_table(5)

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

//findDeletedNumber([1,2,3,4,5,6,7,8,9], [3,2,4,6,7,8,1,9])

/**Usually when you buy something, you're asked whether your credit card number, phone number or answer to your most secret question is still correct. However, since someone could look over your shoulder, you don't want that shown on your screen. Instead, we mask it.
 
 Your task is to write a function maskify, which changes all but the last four characters into '#'.*/

func maskify(_ string:String) -> String {
    
    var maskedString = ""
    
    for (index, letter) in string.enumerated() {
        index < string.count - 4 ? maskedString.append("#") : maskedString.append(letter)
    }
    
    return maskedString
}

//maskify("Skippy")
//maskify("Nananananananananananananananana Batman!")

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

//accum("abcd")
//accum("RqaEzty")
//accum("cwAt")

/**Simple, given a string of words, return the length of the shortest word(s).
 String will never be empty and you do not need to account for different data types.
 */
func find_short(_ str: String) -> Int {
    var wordCountArray = [Int]()
    
    str.split(separator: " ").forEach { wordCountArray.append($0.count) }
    
    wordCountArray.sort(by: <)

    return wordCountArray[0]
}

//find_short("bitcoin take over the world maybe who knows perhaps")
//find_short("lets talk about javascript the best language")
//find_short("i want to travel the world writing code one day")

/**Digital root is the recursive sum of all the digits in a number.

Given n, take the sum of the digits of n. If that value has more than one digit, continue reducing in this way until a single-digit number is produced. The input will be a non-negative integer.*/

//func digitalRoot(of number: Int) -> Int {
//    let arrayOfDigits = String(number).compactMap { $0.wholeNumberValue }
//
//    let reducedNumber = arrayOfDigits.reduce(0, +)
//
//    if reducedNumber > 9 { return digitalRoot(of: reducedNumber) }
//
//    return reducedNumber
//}

func digitalRoot(of number: Int) -> Int {
    let reducedNumber = String(number).compactMap { $0.wholeNumberValue }.reduce(0, +)

    return reducedNumber > 9 ? digitalRoot(of: reducedNumber) : reducedNumber
}
 
//16  -->  1 + 6 = 7
//942  -->  9 + 4 + 2 = 15  -->  1 + 5 = 6
//132189  -->  1 + 3 + 2 + 1 + 8 + 9 = 24  -->  2 + 4 = 6
//493193  -->  4 + 9 + 3 + 1 + 9 + 3 = 29  -->  2 + 9 = 11  -->  1 + 1 = 2
//
//digitalRoot(of: 16)
//digitalRoot(of: 942)

/**Create a function that returns the sum of the two lowest positive numbers given an array of minimum 4 positive integers. No floats or non-positive integers will be passed.
 
 For example, when an array is passed like [19, 5, 42, 2, 77], the output should be 7.

 [10, 343445353, 3453445, 3453545353453] should return 3453455.*/

func sumOfTwoSmallestIntegersIn(_ array: [Int]) -> Int {
    let sortedArr = array.sorted()
    
    return sortedArr[0] + sortedArr[1]
}
//
//sumOfTwoSmallestIntegersIn([19, 5, 42, 2, 77])
//sumOfTwoSmallestIntegersIn([10, 343445353, 3453445, 3453545353453])

/**Task
Each day a plant is growing by upSpeed meters. Each night that plant's height decreases by downSpeed meters due to the lack of sun heat. Initially, plant is 0 meters tall. We plant the seed at the beginning of a day. We want to know when the height of the plant will reach a certain level.*/

func growingPlant(_ upSpeed: Int, _ downSpeed: Int, _ desiredHeight: Int) -> Int {
    var output = 0
    var days = 1
    
    while output <= desiredHeight {
        output += upSpeed
        if output >= desiredHeight {
            return days
        } else {
            output -= downSpeed
            days += 1
        }
    }
    
    return days
}

//growingPlant(100, 10, 910)
//growingPlant(10, 9, 4)
//growingPlant(5, 2, 6)

/**In this kata you get the start number and the end number of a region and should return the count of all numbers except numbers with a 5 in it. The start and the end number are both inclusive!*/

func dontGiveMeFive(_ start: Int, _ end: Int) -> Int {

    var numArray = [Int]()
    for number in start...end {
        if String(number).contains("5") {
            continue
        } else {
            numArray.append(number)
        }
    }
    
    return numArray.count
}

//dontGiveMeFive(1,9)
//dontGiveMeFive(4,17)

/**Your task is to write function findSum.
Upto and including n, this function will return the sum of all multiples of 3 and 5.
For example:*/

func findSum(_ n: Int) -> Int {
    var sum = 0
    
    for num in 0...n {
        if num % 3 == 0 || num % 5 == 0 {
            sum += num
        }
    }
    
    return sum
}

//findSum(5)
//findSum(10)

/**Write function replaceAll (Python: replace_all) that will replace all occurrences of an item with another.
Python / JavaScript: The function has to work for strings and lists.
Example: replaceAll [1,2,2] 1 2 -> in list [1,2,2] we replace 1 with 2 to get new list [2,2,2]*/

func replaceAll<T: Equatable>(array: [T], old: T, new: T) -> [T] {
    var newArr: [T] = []
    
    array.forEach {
        $0 == old ? newArr.append(new) : newArr.append($0)
    }
    
    return newArr
}

//replaceAll(array: [1,2,2], old: 1, new: 2) // [2,2,2]

/**
 Create a function oddOne that takes an [Int] as input and outputs the index at which the sole odd number is located.
 This method should work with arrays with negative numbers. If there are no odd numbers in the array, then the method should output nil.
 Examples:
 */

func oddOne(_ arr: [Int]) -> Int? {
    return arr.enumerated().filter({ $0.element % 2 != 0 }).map({ $0.offset }).first
}

//oddOne([2,4,6,7,10]) // => 3
//oddOne([2,16,98,10,13,78]) // => 4
//oddOne([4,-8,98,-12,-7,90,100]) // => 4
//oddOne([2,4,6,8]) // => nil

/**
 Create a function add(n)/Add(n) which returns a function that always adds n to any number
 */

func add(_ n: Int) -> ((Int) -> Int) {
    func a(_ b: Int) -> Int { return n + b }
    return a(_:)
}

//currying: add parameters to a fxn that adds to another fxn
//add(1)(3)

//func add(_ n: Int) -> ((Int) -> Int) {
//  return { return $0 + n }
//}

//func add(_ n: Int) -> ((Int) -> Int) {
//    return { n + $0 }
//}

/**
 Given the triangle of consecutive odd numbers:
 */
func rowSumOddNumbers(_ row: Int) -> Int {
    var currentNumber = 1
    var sum = 0
    
    for r in 1...row {
        for _ in 1...r {
            if r == row {
                sum += currentNumber
            }
            currentNumber += 2
        }
    }
    
    return sum
}

//rowSumOddNumbers(1) // 1
//rowSumOddNumbers(2) // 3 + 5 = 8

/**
 Determine the total number of digits in the integer (n>=0) given as input to the function. For example, 9 is a single digit, 66 has 2 digits and 128685 has 6 digits. Be careful to avoid overflows/underflows.
 */

func digits(num n: UInt64) -> Int {
    return String(n).count
}

//digits(num: 0)
//digits(num: 12345)
//digits(num: 9876543210)

/**
 Given a two-dimensional array of integers, return the flattened version of the array with all the integers in the sorted (ascending) order.
 Example:
 Given [[3, 2, 1], [4, 6, 5], [], [9, 7, 8]], your function should return [1, 2, 3, 4, 5, 6, 7, 8, 9].
 */

func flattenAndSort<T: Comparable>(_ arr: [[T]]) -> [T] {
    return arr.flatMap({ return $0 }).sorted()
}

//flattenAndSort([[3, 2, 1], [4, 6, 5], [], [9, 7, 8]])

/**
 Write a method that will search an array of strings for all strings that contain another string, ignoring capitalization. Then return an array of the found strings.

 The method takes two parameters, the query string and the array of strings to search, and returns an array.

 If the string isn't contained in any of the strings in the array, the method returns an array containing a single string: "Empty" (or Nothing in Haskell, or "None" in Python and C)
 */

func wordSearch(_ str:String, _ arr:[String]) -> [String] {
    let result = arr.filter { $0.lowercased().contains(str.lowercased()) }
    return result.isEmpty ? ["Empty"] : result
}

//wordSearch("ab", ["za", "ab", "abc", "zab", "zbc"])
//wordSearch("me", ["home", "milk", "Mercury", "fish"])
//wordSearch("abcd", ["za", "aB", "Abc", "zAB", "zbc"])

/**
 Your task is to add up letters to one letter.
 The function will be given an Array<Character>, each one being a letter to add, and the function will return a Character.
 */

func addLetters(_ letters: [Character]) -> Character {
    let alphabet = "abcdefghijklmnopqrstuvwxyz"
    
    var result: Character = "z"
    var indexArray = [Int]()
    
    for (index, letter) in alphabet.enumerated() {
        if letters.contains(letter) {
            indexArray.append(index + 1)
        }
    }
    
    var count = indexArray.enumerated().reduce(0) { $0 + $1.element }
    print(count)
    
    if count > 26 {
        count -= 26
    }
    
    for (index, letter) in alphabet.enumerated() {
        if index == count - 1 {
            result = letter
        }
    }
    
    return result
}

//addLetters(["a", "b", "c"])
//addLetters(["z"])
//addLetters(["a", "b"])
//addLetters(["c"])
//addLetters(["z", "z", "z", "a"])
//addLetters(["y", "c", "b"])
//addLetters([])

/**
 Write a function that takes two strings, A and B, and returns the length of the longest possible substring that can be formed from the concatenation of either A + B or B + A containing only characters that do not appear in both A and B.
 */

func longestSubstring(_ a: String, _ b: String) -> Int {
    var dict = [Character : Int]()
    
    var abString = a + b
    var baString = b + a
    
    abString.enumerated().forEach {
        if dict[$0.element] == nil {
            dict[$0.element] = $0.offset
        } else {
            dict.updateValue($0.offset + 1, forKey: $0.element)
        }
    }
    
//    print(dict)

    return 0
}

//longestSubstring("piquancy", "refocusing")

/**
 Jaden Smith, the son of Will Smith, is the star of films such as The Karate Kid (2010) and After Earth (2013). Jaden is also known for some of his philosophy that he delivers via Twitter. When writing on Twitter, he is known for almost always capitalizing every word. For simplicity, you'll have to capitalize each word, check out how contractions are expected to be in the example below.

 Your task is to convert strings to how they would be written by Jaden Smith. The strings are actual quotes from Jaden Smith, but they are not capitalized in the same way he originally typed them.

 Example:

 Not Jaden-Cased: "How can mirrors be real if our eyes aren't real"
 Jaden-Cased:     "How Can Mirrors Be Real If Our Eyes Aren't Real"
 */

extension String {
    func toJadenCase() -> String {
        return self.components(separatedBy: " ").map { return $0.first!.uppercased() + $0.dropFirst(1) }.joined(separator: " ")
    }
}

//let stringToTest = "most trees are blue"
//stringToTest.toJadenCase()

/**
 We will call a natural number a "doubleton number" if it contains exactly two distinct digits. For example, 23, 35, 100, 12121 are doubleton numbers, and 123 and 9980 are not.

 For a given natural number n (from 1 to 1 000 000), you need to find the next doubleton number. If n itself is a doubleton, return the next bigger than n.
 */

func doubleton(_ num: Int) -> Int {
    return Set(String(num + 1).compactMap{ $0.wholeNumberValue }).count == 2 ? num + 1 : doubleton(num + 1)
}

//doubleton(120)
//doubleton(1234)
//doubleton(10)

/**
 Task
 You'll have to translate a string to Pilot's alphabet (NATO phonetic alphabet).
 Input:
 If, you can read?

 Output:
 India Foxtrot , Yankee Oscar Uniform Charlie Alfa November Romeo Echo Alfa Delta ?

 Note:
 There are preloaded dictionary you can use, named NATO
 The set of used punctuation is ,.!?.
 Punctuation should be kept in your return string, but spaces should not.
 Xray should not have a dash within.
 Every word and punctuation mark should be seperated by a space ' '.
 There should be no trailing whitespace
 */

func toNato(_ words: String) -> String {
    let letters =
        ["A": "Alfa",  "B": "Bravo",   "C": "Charlie",
        "D": "Delta",  "E": "Echo",    "F": "Foxtrot",
        "G": "Golf",   "H": "Hotel",   "I": "India",
        "J": "Juliett","K": "Kilo",    "L": "Lima",
        "M": "Mike",   "N": "November","O": "Oscar",
        "P": "Papa",   "Q": "Quebec",  "R": "Romeo",
        "S": "Sierra", "T": "Tango",   "U": "Uniform",
        "V": "Victor", "W": "Whiskey", "X": "Xray",
        "Y": "Yankee", "Z": "Zulu", "." : ".", "!" : "!", "?" : "?", "," : ",", "(" : "(", ")" : ")", "\"" : "\""]
    
    var natoTranslation = ""

    words.uppercased().enumerated().forEach {
        if (letters[String($0.element)] != nil) {
            natoTranslation.append(letters[String($0.element)]!)
            if ($0.offset != words.count - 1) {
                natoTranslation.append(" ")
            }
        }
    }
    
    return natoTranslation
}

//toNato("If you can read")
//toNato("go for it!")

/**
 Task
 King Arthur and his knights are having a New Years party. Last year Lancelot was jealous of Arthur, because Arthur had a date and Lancelot did not, and they started a duel.

 To prevent this from happening again, Arthur wants to make sure that there are at least as many women as men at this year's party. He gave you a list of integers of all the party goers.

 Arthur needs you to return true if he needs to invite more women or false if he is all set.
 */

func inviteMoreWomen(_ arr: [Int]) -> Bool {
    return arr.reduce(0, +) >= 1
}
//
//inviteMoreWomen([1, -1, 1])
//inviteMoreWomen([-1, -1, -1])
//inviteMoreWomen([1, -1])
//inviteMoreWomen([1, 1, 1])

/**
 Write a function that takes in a string of one or more words, and returns the same string, but with all five or more letter words reversed (like the name of this kata).

 Strings passed in will consist of only letters and spaces.
 Spaces will be included only when more than one word is present.
 */

func spinWords(in sentence: String) -> String {
    return sentence.components(separatedBy: " ").map { $0.count >= 5 ? String($0.reversed()) : $0 }.joined(separator: " ")
}

//spinWords(in: "Hey fellow warriors")
//spinWords(in: "This is a test")
//spinWords(in: "This is another test")

/**
 There is an array with some numbers. All numbers are equal except for one. Try to find it!
 It’s guaranteed that array contains at least 3 numbers.
 The tests contain some very huge arrays, so think about performance.
 */

//func findUniq(_ arr: [Double]) -> Double {
//
//}

//findUniq([ 1, 1, 1, 2, 1, 1 ])
//findUniq([1.0, 0.0, 0.0])
//findUniq([ 3, 10, 3, 3, 3 ])
//findUniq([ 0, 0, 0.55, 0, 0 ])

/**
 Given two arrays a and b write a function comp(a, b) (orcompSame(a, b)) that checks whether the two arrays have the "same" elements, with the same multiplicities. "Same" means, here, that the elements in b are the elements in a squared, regardless of the order.
 */

func comp(_ a: [Int], _ b: [Int]) -> Bool {
    return a.map { pow(Double($0), 2) }.sorted() == b.map { Double($0) }.sorted()
}

var a1 = [121, 144, 19, 161, 19, 144, 19, 11];
var a2 = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]

//comp(a1, a2)
