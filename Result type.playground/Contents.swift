import UIKit


// swift Result type is implemented as an enum that has two cases
// 1. case success
// 2. case failure



//enum NetworkError: String, Error {
//    case invalidURL = "The url provided is invalid!"
//}


enum NetworkError: Error {
    case invalidURL
}


// here is an example of a function that hits a url to get String Data. during this network request errors can potentially happen

func fetchData(urlString: String, completionHandler: @escaping (Result<String, NetworkError>) -> Void) {
    guard let url = URL(string: urlString) else {
        completionHandler(.failure(NetworkError.invalidURL))
        return
    }
    print("Fetching the data from \"\(url.absoluteString)\"...")
    let data = "THIS IS THE DATA YOU FETCHED!"
    completionHandler(.success(data))
}


fetchData(urlString: "https://hackingwithswift.com") { result in
    switch(result) {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error.localizedDescription)
    }

}
