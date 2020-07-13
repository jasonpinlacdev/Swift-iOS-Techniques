import UIKit

func greaterThanThreeFunction(number: Int) -> Bool {
    return number > 3
}

var greaterThanThreeClosure = { number in
    return number > 3
}


var divisibleByFive = { number in
    number % 5 == 0
}

func filterWithPredicate(closure: (Int) -> Bool, numbers: [Int]) -> [Int] {
    var filteredList = [Int]()
    
    for number in numbers {
        if closure(number) {
            filteredList.append(number)
        }
    }
    
    return filteredList
}


let greaterThanThreeList = filterWithPredicate(closure: greaterThanThreeClosure, numbers: [1,2,3,4,5,10])

let divisibleByFiveList = filterWithPredicate(closure: divisibleByFive, numbers: [1,2,3,4,5,10])
