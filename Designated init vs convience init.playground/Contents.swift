import UIKit

class Car {
    
    var year: Int
    var make: String
    var model: String
    var color: String
    
    // this is a designated initializer
    // its job is to guarantee that an object has all its properties initialized to a value or nil
    init(year: Int, make: String, model: String, color: String) {
        self.year = year
        self.make = make
        self.model = model
        self.color = color
    }
    
    
//    init(year: Int) {
//        self.year = year
//        self.make = "N/A"
//        self.model = "N/A"
//        self.color = "N/A"
//    }
    
    // this is convenience initializer
    //the difference between having a convenience initializer versus just having a second designated initializer that takes in the same parameters is just so that you don't need to repeat the code writing in the first initializer. compare it to the designated initializer commented out  above
    convenience init(year: Int) {
        self.init(year: year, make: "N/A", model: "N/a", color: "N/A")
    }
    
    // Youre probably wondering why you would choose using designated initializers vs convenience initializer. The reason is because with the multiple desginated initializers you have a lot of duplicated lines of code and as you can see with the convenience init all properties are initialized on 1 line by calling self.init and suppling the default arguments
    
    // Keep in mind that there really is no wrong or right answer whether youd decide to use designated inits or convenience inits. It's just a matter of perspective and how want to design the interface of your class for your users to use
}

