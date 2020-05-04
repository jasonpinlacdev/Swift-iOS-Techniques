import UIKit

// HTTP Networking Requests

/*
 all modern apps communicate with the servers on the internet at some point.
 the de factor way of making http networking requests is by using a class called URLSession.
 the URLSession class is actually part of a group of classes that work together to make and respond to HTTP requests.
 
 - You use URLSession to create a session. You can think of a session as an open tab or window in your webbrowser, which groups together many HTTP requests over subsequent website visits.
 - The URLSession is used to create URLSessionTask instances, which can fetch and return data to your app, and download and upload files to webservices.
 - You configure a session with a URLSessionConfiguration object. This configuration manages caching, cookies, connectivity and credentials.
 - To make a request, you create a data task, of class URLSessionDataTask, and you provide it with a URL, such as https://twitter.com/api/, and a completion handler. This is a closure that’s executed when the request’s response is returned to your app.
 - When the completion handler is executed, you can inspect the returned data and take appropriate action, such as loading the data into a Tweet UI.
 
 */


// 1 setup HTTP request using URLSession

// 2 make the request with URLSessionDataTask

// 3 print the returned response data

// 4 properly validate the response data

// 5 convert the response data to objects using JSON decoder


struct Person: Codable {
    var firstName: String
    var lastName: String
    var age: Int
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case age
    }
}


var persons = [Person]()

let urlString = "https://learnappmaking.com/ex/users.json"
if let url = URL(string: urlString) {
    let urlRequest = URLRequest(url: url)
    
    let session = URLSession.shared
    

    // the closure gets executed when the task request completes, so when a response has returned from the webserver. This can be any kind of response, including errors, timeouts, 404s, and actual JSON data.
    // We can use the data object, of type Data, to check out what data we got back from the webserver, such as the JSON we’ve requested. data is a Data object, so it has no visual representation yet. We can convert or interpret it as JSON though, but that requires some more code.
    // The response object, of type URLResponse, can tell us more about the request’s response, such as its length, encoding, HTTP status code, return header fields, etcetera
    // The error object contains an Error object if an error occurred while making the request. When no error occurred, it’s simply nil.
    let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) -> Void in
        // validate the completion handler
        // 1. did any errors occur
        if error != nil {
            print("Client error occured in the completion handler: \(error?.localizedDescription)")
            return
        }
        
        // 2. is the http response code expected
        // The guard let syntax checks if the two conditions evaluate to false, and when that happens the else clause is executed. It literally “guards” that these two conditions are true. It’s easiest to read this as: “Guard that response is a HTTPURLResponse and statusCode is between 200 and 299, otherwise call handleServerError().”
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            print("Server Error. HTTP response was not what we wanted in the completion handler: \(response)")
            return
        }
        
        // 3. did you get the data in the right format
        //The next validation we’re going to do, checks the so-called MIME type of the response. This is a value that most webservers return, that explains what the format of the response data is. We’re expecting JSON, so that’s what we’ll check
        guard let mime = response?.mimeType, mime == "application/json" else {
            print("Wrong MIME type!")
            return
        }
        
        // 4. decode the data into seift objects using JSONDecoder
        if let data = data {
//            print(String(data: data, encoding: .utf8))
            do {
                let persons = try JSONDecoder().decode([Person].self, from: data)
                print(persons)
            } catch {
                print("Error decoding json data into swift objects: \(error)")
            }
        } else {
            print("Cannot unwrap the data")
        }
        
        
        
    })
    
    // By calling the resume() function on the task object, the request is executed and the completion handler is invoked at some point.
    task.resume()
}




