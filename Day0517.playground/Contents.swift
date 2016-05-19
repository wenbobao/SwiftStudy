//: Playground - noun: a place where people can play

// From 108 页

import UIKit


//switch  每一个 case 分支都必须包含至少一条语句
//一个 case 也可以包含多个模式,用逗号把它们分开
//case 分支的模式允许将匹配的值绑定到一个临时的常量或变量,这些常量或变量在该 case 分支里就可以被引用 了——这种行为被称为值绑定(value binding)。

//在值绑定中，如果匹配了所有情况，不用再写默认分支



//---------------------------控制转移语句------------------------

// continue 
//continue 语句告诉一个循环体立刻停止本次循环迭代,重新开始下次循环迭代。就好像在说“本次循环迭代我已 经执行完了”,但是并不会离开整个循环体。

// swift 的switch  case 不需要break，如果你需要case 完成后继续执行，可以用 fallthrough

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
case 4:
    description += " A"
    fallthrough
default:
    description += " an integer."
}
print(description)

//注意: fallthrough 关键字不会检查它下一个将会落入执行的 case 中的匹配条件。 fallthrough 简单地使代 码执行继续连接到下一个 case 中的执行代码,这和 C 语言标准中的 switch 语句特性是一样的。

//---------------------------guard------------------------

//使用 guard 语句来要求条件必须为真 时,以执行 guard 语句后的代码。不同于 if 语句,一个 guard 语句总是有一个 else 分句,如果条件不为真则执 行 else 分句中的代码。

//guard let location = person["location"] else {
//    print("I hope the weather is nice near you.")
//    return
//}


//---------------------------检测 API 可用性------------------------

if #available(iOS 9 ,OSX 10.10,*){
    // 在 iOS 使用 iOS 9 的 API, 在 OS X 使用 OS X v10.10 的 API
}else{
    // 使用先前版本的 iOS 和 OS X 的 API
}


//---------------------------函数------------------------

func sayHello(personName: String) -> String {
    return "hello " + personName
}

sayHello("bob")


func sayHelloWorld() -> String{
    return "hello world !"
}

sayHelloWorld()

func sayHello(personName: String,age: Int) -> String {
    return "hello " + personName + " age :" + String(age)
}

//当调用超过一个参数的函数时,第一个参数后的参数根据其对应的参数名称标记
sayHello("bob", age: 13)

func sayHelloVoid(name:String){
    print("hello + \(name)")
}

sayHelloVoid("bob")


//多重返回值函数

//返回元组
func minMax(array:[Int]) ->(min:Int,max:Int){
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count]{
        if value < currentMin{
            currentMin = value
        }else if value > currentMax{
            currentMax = value
        }
    }
    
    return (currentMin,currentMax)
}

minMax([5,9,7,8,4]).0
minMax([5,9,7,8,4]).max

//minMax([]) 会报错

//可选元组返回类型

// 如果函数返回的元组类型有可能整个元组都“没有值”,你可以使用可选的(Optional) 元组返回类型反映整个 元组可以是 nil 的事实。你可以通过在元组类型的右括号后放置一个问号来定义一个可选元组,例如 (Int, Int)? 或 (String, Int, Bool)?

//注意 可选元组类型如 (Int, Int)? 与元组包含可选类型如 (Int?, Int?) 是不同的.可选的元组类型,整个元组是可选 的,而不只是元组中的每个元素值。

func minMax2(array:[Int]) ->(min:Int,max:Int)?{
    if array.isEmpty{
        return nil
    }

    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count]{
        if value < currentMin{
            currentMin = value
        }else if value > currentMax{
            currentMax = value
        }
    }
    
    return (currentMin,currentMax)
}

if let bounds = minMax2([4,5]){
    print(bounds.max)
}


//函数参数名称

//func sayHello(personName: String,age: Int) -> String {
//    return "hello " + personName + " age :" + String(age)
//}
// personName 省略外部参数名  age 用局部参数名 作为外部参数名

// 指定外部参数名

//注 : 如果你提供了外部参数名,那么函数在被调用时,必须使用外部参数名。

func sayHello(to person: String, and anotherPerson: String) -> String {
    return "Hello \(person) and \(anotherPerson)!"
}
print(sayHello(to: "Bill", and: "Ted"))

//如果你不想为第二个及后续的参数设置外部参数名,用一个下划线( _ )代替一个明确的参数名。

func sayHello( person: String, _ anotherPerson: String) -> String {
    return "Hello \(person) and \(anotherPerson)!"
}
print(sayHello("bob", "hello"))

//注 : 因为第一个参数默认忽略其外部参数名称,显式地写下划线是多余的。

//默认参数值

func someFoundation (paragrams : Int = 8){
    print(paragrams)
}

someFoundation(10)
someFoundation()


//可变参数

// 一个 可变参数(variadic parameter) 可以接受零个或多个值

func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    
    for number in numbers{
        total += number
    }
    return total / Double(numbers.count)
}

arithmeticMean(4,5,6)

//一个函数最多只能有一个可变参数
//如果函数有一个或多个带默认值的参数,而且还有一个可变参数,那么把可变参数放在参数表的最后

//常量参数和变量参数

//函数参数默认是常量 , 试图在函数体中更改参数值将会导致编译错误。这意味着你不能错误地更改参数值

func alignLeft(aa: String, totalLength: Int, pad: Character) -> String
{
    var string = aa
    let amountToPad = totalLength - string.characters.count
    if amountToPad < 1 {
        return string
    }
    let padString = String(pad)
    for _ in 1...amountToPad {
        string = padString + string
    }
    return string
}

func alignRight(var string: String, totalLength: Int, pad: Character) -> String {
    let amountToPad = totalLength - string.characters.count
    if amountToPad < 1 {
        return string
    }
    let padString = String(pad)
    for _ in 1...amountToPad {
        string = padString + string
    }
    return string
}

let originalString = "hello"
let paddedString = alignRight(originalString, totalLength: 10, pad: "-")
let paddedString2 = alignLeft(originalString, totalLength: 10, pad: "-")

//对变量参数所进行的修改在函数调用结束后便消失了,并且对于函数体外是不可见的。变量参数仅仅存在于函数调用的生命周期中。

//输入输出参数
//变量参数,正如上面所述,仅仅能在函数体内被更改。如果你想要一个函数可以修改参数的值,并且想要在这些 修改在函数调用结束后仍然存在,那么就应该把这个参数定义为输入输出参数(In-Out Parameters)
//定义一个输入输出参数时,在参数定义前加 inout 关键字。


//函数类型

func addTwoInts(a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(a: Int, _ b: Int) -> Int {
    return a * b
}

func printHelloWorld() {
    print("hello, world")
}

var mathFunction :(Int,Int)->Int = addTwoInts

mathFunction(2,3)


//---------------------------闭包------------------------ 133 页

//闭包表达式


//---------------------------类和结构体------------------------ 151 页

//定义语法
// 首字母大写
class SomeClass{
    
}
struct SomeStructure {
    
}

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//类和结构体的实例

let someVideoMode = VideoMode()

//结构体类型的成员逐一构造器

let vga = Resolution(width: 5, height: 5)
var cinema = vga  //vga 和cinema 是两个完全不同的实例  但是值相同

//结构体和枚举是值类型

//值类型被赋予给一个变量、常量或者被传递给一个函数的时候,其值会被拷贝。

//在 Swift 中,所有的基本类型:整数(Integer)、浮 点数(floating-point)、布尔值(Boolean)、字符串(string)、数组(array)和字典(dictionary),都是 值类型,并且在底层都是以结构体的形式所实现。

//类是引用类型
//与值类型不同,引用类型在被赋予到一个变量、常量或者被传递到一个函数时,其值不会被拷贝。因此,引用的是已存在的实例本身而不是其拷贝。

let tenEighty = VideoMode()
tenEighty.resolution = vga
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same Resolution instance.")
}
//tenEighty &  alsoTenEighty 是 同一个实例的两种叫法

//需要注意的是 tenEighty 和 alsoTenEighty 被声明为常量而不是变量。然而你依然可以改变 tenEighty.frameRate 和 alsoTenEighty.frameRate ,因为 tenEighty 和 alsoTenEighty 这两个常量的值并未改变。它们并不“存储”这 个 VideoMode 实例,而仅仅是对 VideoMode 实例的引用。所以,改变的是被引用的 VideoMode 的 frameRate 属 性,而不是引用 VideoMode 的常量的值。

//“等价于”(用三个等号表示, === )与“等于”(用两个等号表示, == )的不同:


// End 159 页