//: Playground - noun: a place where people can play

import UIKit

//---------------------------类和结构体------------------------ 151 页

//定义语法
// 首字母大写
class Some1Class{
    
}
struct Some1Structure {
    
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




//---------------------------属性------------------------ 160 页


//存储属性 (类和结构体)
//firstValue 变量存储属性
//length 常量存储属性
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

//如果创建了一个结构体，并把它赋值给一个常量,则无法修改该实例的任何属性,即使定义了变量存储属性
let rangeOfThreeItems2 = FixedLengthRange(firstValue: 0, length: 3)
//rangeOfThreeItems2.firstValue = 6  报错

//原因: 因为结构体是值类型。当值类型的实例被声明为常量的时候,它的所有属性也就成了常 量。
//属于引用类型的类(class)则不一样。把一个引用类型的实例赋给一个常量后,仍然可以修改该实例的变量属性。

//延迟存储属性

//延迟存储属性是指当第一次被调用的时候才会计算其初始值的属性。在属性声明前使用 lazy 来标示一个延迟存储属性。
//注: 必须将延迟存储属性声明成变量（var）, 因为属性的初始值可能在实例构造完成之后才会得到。而常量属性在构造过程完成之前必须要有初始值,因此无法声明成延迟属性。
//相当于使用的时候创建
struct example{
    lazy var name = [String]()
}

//计算属性 (类,结构体,枚举)

//计算属性不直接存储值,而是提供一个 getter 和一个可 选的 setter,来间接获取和设置其他属性或变量的值。

struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    //计算属性
//    var center: Point {
//        get {
//            let centerX = origin.x + (size.width / 2)
//            let centerY = origin.y + (size.height / 2)
//            return Point(x: centerX, y: centerY)
//        }
//        set(newCenter) {
//            origin.x = newCenter.x - (size.width / 2)
//            origin.y = newCenter.y - (size.height / 2)
//        }
//    }
    
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
// 如果计算属性的 setter 没有定义表示新值的参数名,则可以使用默认名称 newValue 。
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0),
    size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")

//只读计算属性
//只有getter没有setter的计算属性叫做只读计算属性。只读计算属性总是返回一个值,只能访问，不能设置新值
//注: 必须使用var关键字定义计算属性,包括只读计算属性,因为它们的值不是固定的。let 关键字只用来声明常量属性,表示初始化后再也无法修改的值。

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    //只读计算属性 ,可以去掉get关键词和花括号
    var volume: Double {
//        get {
//            return width * height * depth
//        }
        return width * height * depth
    }
}

//属性观察器
//属性观察器监控和响应属性值的变化,每次属性被设置值的时候都会调用属性观察器,甚至新的值和现在的值相同的时候也不例外。

//willSet 观察器会将新的属性值作为常量参数传入,在 willSet 的实现代码中可以为这个参数指定一个名称,如果不指定则参数仍然可用,这时使用默认名称 newValue 表示。类似地, didSet 观察器会将旧的属性值作为参数传入,可以为该参数命名或者使用默认参数名 oldValue

class StepCounter {
    //为存储属性totalSteps添加属性观察器
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 100
stepCounter.totalSteps = 200

//全局变量和局部变量

//全局变量是在函数、方法、闭包或任何类型之外定义的变量。局部变量是在函数、方法或闭包内部定义的变量。

//类型属性

//使用关键字 static 来定义类型属性。在为类(class)定义计算型类型属性时,可以使用关键字 class 来支持子 类对父类的实现进行重写

struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1 }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6 }
}

class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27 }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}
//相当于OC的+()
print(SomeStructure.storedTypeProperty)
// 输出 "Some value." 
SomeStructure.storedTypeProperty = "Another value."
print(SomeStructure.storedTypeProperty)
// 输出 "Another value.” 
print(SomeEnumeration.computedTypeProperty)
// 输出 "6" print(SomeClass.computedTypeProperty)

//---------------------------方法------------------------ 170 页
