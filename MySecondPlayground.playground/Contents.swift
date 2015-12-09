//: Playground - noun: a place where people can play

import UIKit

var myIntArray :[Int]
myIntArray = [Int]()
myIntArray.append(7)
print(myIntArray[0])
print(myIntArray.count)
myIntArray.insert(123, atIndex: 0)
//myIntArray.removeAtIndex(7)
for number in myIntArray
{
    print(number)
}

for number in (var count = 0;
    count < myIntArray.count;
    count++)
{
    print(myIntArray[count])
}
