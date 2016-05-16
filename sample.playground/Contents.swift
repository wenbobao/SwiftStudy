//: Playground - noun: a place where people can play

import UIKit

// ?一个可选的值,是一个具体的值或者 是 nil 以表示值缺失。
var str = "Hello, playground"
print(str)

let floatValue :Float = 32.1

let label = "hello"
let width = 35
let widthLabel = label + String(width)

let apple = 3

let orange = 1 + 3

let appleSummary = "I have \(apple) apples"

let shppingList = ["hello","good","nice"]

let numList = [1,2,3]

let emptyArray = [String]()
let emptyDictionry = [String : String]()

let scoreList = [80,76,98]

for score in scoreList {
    if score < 80 {
        print("\(score) 中")
    }else if score > 90 {
        print("\(score) 优")
    }else {
        print("\(score) 良")
    }
}

var loop = 0
for i in 0..<4 {
    loop += i
}
print(loop)

var firstloop = 0
for var i = 0 ; i < 4 ; i++ {
    firstloop += i
}
print(firstloop)

var secondLoop = 0
for i in 0...4 {
    secondLoop += i
}
print(secondLoop)

if apple > 2 {
    print("hhaha")
}

var optionSting : NSString?
//var optionSting : NSString? = "hello"
print(optionSting == nil)

if let name = optionSting {
    print("hello")
}

let nickName :String? = nil
let fullName :String = "Wenbo bao"
let information = "Hi \(nickName ?? fullName)"

let fruit = "apple"

switch fruit{
case "apple" :
    print("apple")
case "orange" :
    print("orange")
default:
    print("nothing")
}

let testDictionary = ["1":"apple","2":"orange","3":"banana"]

for (key,value) in testDictionary{
    
}

//函数和闭包

func hello(name:String) -> String{
    return "hello:\(name)"
}

hello("bob")

func helloDay(name:String,day:NSString) -> String{
    return "hello:\(name),Today is \(day)"
}

helloDay("wenbo", day: "Friday")

func sumOf(numbers:Int...) -> Int{
    var sum = 0
    for number in numbers{
        sum += number
    }
    return sum
}

sumOf(1,2,3)

func avageOf(numbers:Int...) -> Int {
    var sum = 0
    for number in numbers{
        sum += number
    }
    
    return (sum / numbers.count)
}

avageOf(1,2,3)

//闭包 这个地方类似block
scoreList.map({ (number : Int) -> Int in
    let result = 3 * number
    return result
})

//对象和类

class Shape{
    var numberOfSides = 0
    func simpleDescription() -> String{
        return "A shape with \(numberOfSides) sides"
    }
}

var shape = Shape()

shape.numberOfSides = 7
shape.simpleDescription()


class NameShape{
    var numberOfSides = 0
    var name : String
    
    init(name : String){
        self.name = name
    }
    
    func simpleDescription() -> String{
        return "\(name) shape with \(numberOfSides) sides"
    }
}

var shape1 = NameShape(name: "Rectange")
shape1.numberOfSides = 4
shape1.simpleDescription()

class Square: NameShape {
    var sideLength : Double
    
    init(sideLength : Double, name : String){
        self.sideLength = sideLength
        super.init(name: name)
    }
    
    func area() ->Double{
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String{
        return "I am override!"
    }
}

var square = Square(sideLength: 4.5, name: "Square")
square.simpleDescription()
square.area()

class RectangeShape: NameShape {
    var sideLength : Double = 0.0
    
//    init(sideLength : Double, name : String){
//        self.sideLength = sideLength
//        super.init(name: name)
//    }
    
    var perimeter : Double{
        get{
            return 3.0 * sideLength
        }
        set{
            
        }
    }
    
    func area() ->Double{
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String{
        return "I am override!"
    }
}

var rec = RectangeShape(name: "hello")
rec.sideLength = 5
rec.area()
rec.perimeter

//枚举

enum Rank : Int{
    case Ace = 1
    case Two
}

//结构体

struct Apple {
    var width : Double
    var length : Double
    var color : UIColor
}

Apple(width: 15, length: 15, color:UIColor.redColor())

//协议和扩展

protocol ExampleProtocal{
    
}

//实现协议 用 继承


//范型
