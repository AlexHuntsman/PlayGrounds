//: Playground - noun: a place where people can play

import Cocoa

var title = "Objects and Classes"

class Shape
{
    var numberOfSides = 0
    func simpleDescription() -> String
    {
        return "A Shape with \(numberOfSides) sides."
    }
}
// Instance of class
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

class NamedShape
{
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String)
    {
        self.name = name
    }
    func simpleDescription() -> String
    {
        return "A shape with \(numberOfSides) sides."
    
    }
}
// Deinitilazer and subClass
class Square: NamedShape
{
    var sideLength: Double
    
    init(sideLength: Double, name: String)
    {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    func area() -> Double
    {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String
    {
        return "A Square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

class EqualateralTriangle: NamedShape
{
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name :String)
    {
        self.siideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }

    var perimeter: Double
    {
        get
        {
            return 3.0 * sideLength
        }
        set
        {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String
    {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}

var triangle = EqualateralTriangle(sideLength: 3.1, name:"a triangle")
print(triangle.perimeter)
triangle.perimiter = 9.9
print(triangle.sideLength)

class TriangleAndSquare
{
    var triangle: EqualateralTriangle
    {
        willSet
        {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square
    {
        willSet
        {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String)
    {
        square = Square(sideLength: size, name: name)
        triangle = EqualateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "Larger square")
print(triangleAndSquare.triangle.sideLength)

let optionalSquare : Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength