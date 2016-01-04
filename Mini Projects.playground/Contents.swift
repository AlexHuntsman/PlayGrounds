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

enum Rank: Int
{
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String
    {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.rawValue

if let convertedRank = Rank(rawValue: 3)
{
    let threeDescription = convertedRank.simpleDescription()
    
    enum Suit
    {
        case Spades, Hearts, Diamonds, Clubs
        func simpleDescription() -> String
        {
            switch self
            {
            case .Spades:
                return "spades"
            case .Hearts:
                return "hearts"
            case .Diamonds:
                return "diamonds"
            case .Clubs:
                return "clubs"
            }
        }
    }
    let hearts = Suit.Hearts
    let heartsDescription = hearts.simpleDescription()
}


func repeatItem<Item>(item: Item, numberOfTimes: Int) -> [Item]
{
    var result = [Item]()
    for _ in 0..<numberOfTimes
    {
        result.append(item)
    }
    return result
}
repeatItem("knock", numberOfTimes:4)
// Reimplement the Swift standard library's optional type
enum OptionalValue<Wrapped>
{
    case None
    case Some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)

func anyCommonElements <T: SequenceType, U: SequenceType where T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element> (lhs: T, _ rhs: U) -> Bool {
    for lhsItem in lhs
    {
        for rhsItem in rhs
        {
            if lhsItem == rhsItem
            {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [3])
