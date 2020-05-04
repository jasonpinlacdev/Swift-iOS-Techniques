import UIKit

//MARK: - CODABLE

/*
codable protocol is used to encode and decode Data formats such as JSON into native swift objects.

JSON format is used to get data into your app. It is efficient, easily parsed, and readable by humans
JSON data is wrapped in curly braces { }. Data types in JSON format are Int, String, Bool, Arrays [].
 
 Here is an example below
 {
     "name": "Spaghetti Bolognese",
     "author": "Reinder's Cooking Corner",
     "url": "https://cookingcorner.com/spaghetti-bolognese",
     "yield": 4,
     "ingredients": ["cheese", "love", "spaghetti", "beef", "tomatoes", "garlic"],
     "instructions": "Cook spaghetti, fry beef and garlic, add tomatoes, add love, eat!"
 }
 
JSONDecoder and JSONEncoder is used to mediate between JSON formatted Data and Swift Data. You can encode any data format in JSON, and decode JSON back to any data format.
 
 You can take your Swift String, Int, Double, URL, Date, Data, Array and Dictionary values, and encode them as JSON.
 
 Similarly, webservices send data encoded as JSON to your app, and you decode the data to native types such as String and Array.
 
 When your recipe app receives the JSON (see above), it can then be decoded into a Swift struct or class, like this one:

 struct Recipe {
     var name:String
     var author:String
     var url:URL
     var yield:Int
     var ingredients:[String]
     var instructions:String
 }
 
 The Codable protocol is used to go from a JSON data object to an actual Swift class or struct. This is called decoding, because the JSON data is decoded into a format that Swift understands. It also works the other way: encoding Swift objects as JSON.
 
 */

// set up the model and conform to Codable
struct User: Codable {
    var firstName: String
    var lastName: String
    var country: String
    
    // What if our JSON properties, like first_name, are different than the Swift struct properties? That’s where CodingKeys comes in. Every class or struct that conforms to Codable can declare a special nested enumeration called CodingKeys. You use it to define properties that should be encoded and decoded, including their names. The enum's cases raw values are of type String and the enum conforms to the CodingKey protocol
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case country
    }
    
    // The CodingKeys enumeration is self-explanatory. It simply maps cases to properties, and uses the string values to select the right property names in the JSON data.
}


// get the json data from a webservice. Here it's represented as a String and converted to JSON data
let jsonString = """
{
    "first_name": "John",
    "last_name": "Doe",
    "country": "United Kingdom"
}
"""

let jsonData = jsonString.data(using: .utf8)!

do {
    let user = try JSONDecoder().decode(User.self, from: jsonData)
    print(user.firstName, user.lastName, user.country)
} catch {
    print("Error decoding JSON Data: \(error.localizedDescription)")
}

// decode the JSON data into swift objects







 

