//: Playground - noun: a place where people can play

import UIKit

var moon = "🌚🌚🌚"
print(moon)

//Method in swift
func simpleMethod(numberOfThings : Int) -> Int
{
    if(numberOfThings > 5)
    {
        return 100
    }
    else if(numberOfThings < -20)
    {
        return -20
    }
    else
    {
        return numberOfThings
    }
}

print(simpleMethod(5))
print(simpleMethod(-45))

//Classes in Swift
class SimpleClass
{
    //Decralation section
    var name :String
    var age :Int
    var isTired :Bool
    
    init()
    {
        self.name = String()
        self.age = -99
        self.isTired = true
    }
    
    convenience init(name : String)
    {
        self.init()
        self.name = name
    }
    convenience init(name :String, age :Int)
    {
        self.init()
        self.name = name
        self.age = age
    }
}
var someInstance = SimpleClass()
print(someInstance.name)
var otherInstace = SimpleClass(name: "derf")
print(otherInstace.name)