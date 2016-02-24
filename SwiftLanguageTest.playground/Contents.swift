//: Playground - noun: a place where people can play

import UIKit


// ?一个可选的值,是一个具体的值或者 是 nil 以表示值缺失。
var str = "Hello, playground"
print(str)

//if 和 let 来处理值缺失
//测试1
var opoptionalName :String? = "bob"

if let name = opoptionalName {
    str = "\(name)"
}else{
    str = "error"
}
//测试2
var opoptionalName2 :String?

if let name = opoptionalName2 {
    str = "\(name)"
}else{
    str = "error"
}

//运行 switch 中匹配到的子句之后,程序会退出 switch 语句,并不会继续向下运行,所以不需要在每个子句结尾 写 break 。
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    } }
print(largest)

 /// ForLoopTest

//1 0到3求和 传统方法
var secondForLoop = 0
for var i = 0; i < 4; ++i {
    secondForLoop += i
}
print(secondForLoop)
//2 0到3求和 ..< 不包括上边界4
var firstForLoop = 0
for i in 0..<4 {
    firstForLoop += i
}
print(firstForLoop)
//3 0到4求和 ... 包括上边界4
var thirdForLoop = 0
for i in 0...4 {
    thirdForLoop += i
}
print(thirdForLoop)

 /// funcTest

func greet(name: String, day: String) ->String {
    return "name: \(name),day: \(day)"
}

greet("bob", day: "today")

//使用元组来让一个函数返回多个值
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        
        }
        sum += score
    }
    return (min, max, sum)
}
let statistics = calculateStatistics([5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)

//函数可以带有可变个数的参数,这些参数在函数内表现为数组的形式:
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum }
sumOf()
sumOf(42, 597, 12)
