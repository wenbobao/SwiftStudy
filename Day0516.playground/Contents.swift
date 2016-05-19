//: Playground - noun: a place where people can play

//: Form 0 页

import UIKit

let string1 = "hello"
let welcome = string1 + " bob"

let number: Int = 16

Int.max
UInt.max

let number1 = 1e2;

let number2 = 3;
let floatNumber = 3.14

let value1 = Double(number2) + floatNumber

let value2 = 3 + 3.14

Int(floatNumber)

//类型别名

typealias WEN = Int

let a: WEN = 23

let some1 = false

//元组

let http404Error = (404, "Not Found")
let http303Error: (Int, String) = (303, "hello")
let http202Error = (code: 404, message: "Not Found")
//将一个元组的内容分解(decompose)成单独的常量和变量
let (status,stayusMessage) = http404Error
status
//只访问一部分
let (http303,_) = http303Error
http303
//使用下标访问
http404Error.0
http202Error.code
http202Error.message

//

let possibleNumber = "123"
let possibleString = "hello"
let convertedNumber = Int(possibleNumber)
let convertedString = Int(possibleString)

//普通可选类型
var surveyAnswer: String? = "hello"

//使用 ! 来获取一个不存在的可选值会导致运行时错误。使用 来强制解析值之前,一定要确定可选包含一个非 nil 的值

//if 语句以及强制解析
if surveyAnswer != nil {
    print("hello : \(surveyAnswer)")
    print("hello : \(surveyAnswer!)") //确定有值可以解包，否则会报错
}

//可选绑定
if let value = surveyAnswer {
    print("hello : \(value)")
//    print("hello : \(value!)") //报错
}
//隐式可选类型

var survary :String! = "hello"

print(survary)


//断言

let age = 3
assert(age >= 0, "hello")


//------------------------基本运算符---------------------


//空合运算符

let defaultColorName = "red"
var userDefinedColorName: String? //默认值为 nil
var colorNameToUse = userDefinedColorName ?? defaultColorName
//相当于三目运算符
userDefinedColorName != nil ? userDefinedColorName! : defaultColorName


// 区间运算符

//a...b 包含b

for index in 1...5{
    print(index)
}
//a..>b 不包含b

//------------------------字符串和字符---------------------


let stringValue = "hello"
stringValue.characters

let helloCharacters: [Character] = ["h","e","l","l","o"]
let hello = String(helloCharacters)
stringValue.startIndex
stringValue.endIndex

//------------------------集合类型---------------------
//数组
var someInts = Array<Int>()
var someInts2 = [Int]()
var someString = String()
var someInt = Int()

someInts.append(3)
someInts.count


var threeDoubles = [Double](count: 3, repeatedValue: 3)

var otherThreeDoubles = Array(count: 3, repeatedValue: 4.5)

var sixDoubles = threeDoubles + otherThreeDoubles

var shoppingList: [Int] = [3,4,4]
var shoppingList2: Array = [3,4,4]
var shoppingList3: Array<Int> = [3,4,4]

sixDoubles.insert(5, atIndex: 0)
sixDoubles.contains(5)

for item in shoppingList{
    
}

for (index,item) in shoppingList.enumerate() {
    
}
//Set

var lettees = Set<Int>()
lettees.insert(3)

//Dictionary

var nameOfIntegers = [Int: String]()

var dictionary = ["1":"apple","2":"orange"]
dictionary.count
dictionary["3"] = "purple"
dictionary

//注 : set & Dictionary 是无序类型，可以通过sort() 排列

//------------------------控制流---------------------

// For 循环
// for-in 循环可以来遍历一个集合里面的所有元素,例如由数字表示的区间、数组中的元素、字符串中的字 符。

for index in 1...5{
    
}

for index in shoppingList{
    
}

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]

for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

for var index = 0; index < 3; ++index{
    
}

//: End 108 页
