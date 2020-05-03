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
    convenience init(year: Int) {
        self.init(year: year, make: "N/A", model: "N/a", color: "N/A")
    }
    
    // Youre probably wondering why you would choose using designated initializers vs convenience initializer. In this case the reason is because with the multiple desginated initializers you have a lot of duplicated lines of code and as you can see with the convenience init all properties are initialized on 1 line by calling self.init and suppling the default arguments
    
    // Keep in mind that there really is no wrong or right answer whether youd decide to use designated inits or convenience inits. It's just a matter of perspective and how want to design the interface of your class for your users to use
    
    // If you are designing a new class then it's okay to only designated inits. Remember the job of the designated init to only to make sure all properties have a default value. The job of the convenience init is to call the designated init and follow up with some sort of custom setup or configuration.

    // I think a really useful use case for the convenience intializer is when you want to extend Apples classes and have a custom set up.
}



// MARK:- DESIGNATED INITIALIZER
// primary initializer whose jobs is to fully initialize all properties introduced by its class before calling it's super initailzier.


// MARK:- CONVENIENCE INITIALIZER
// a secondary initializer that must call the designated initializer of the same class. It is useful when you want to provide default values or a custom setup. A class does not require convenience initializers.

// MARK:- THE 3 RULES

// 1) designated initalizer must call a designated initalizer from the immediate super class IE super.init()

// 2) convenience initializer must call an initializer from the same class

// 3) convenience initailizer must ultimately call a designated intializer from the class IE self.init()
