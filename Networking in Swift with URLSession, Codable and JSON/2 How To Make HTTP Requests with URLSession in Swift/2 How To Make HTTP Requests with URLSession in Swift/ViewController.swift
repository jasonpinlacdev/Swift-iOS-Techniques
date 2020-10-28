//
//  ViewController.swift
//  2 How To Make HTTP Requests with URLSession in Swift
//
//  Created by Jason Pinlac on 10/27/20.
//

import UIKit

struct Post: Codable {
    let userID: Int
    let id: Int
    let title: String
    let body: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id
        case title
        case body
    }
}


struct Person: Codable {
    let age: Int
    let firstName: String
    let lastName: String
    
    enum CodingKeys: String, CodingKey {
        case age
        case firstName = "first_name"
        case lastName = "last_name"
    }
}


class ViewController: UIViewController {
    
    @IBOutlet var APIButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        APIButton.layer.cornerRadius = 5.0
        APIButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    @IBAction func APIButtonTapped(_ sender: Any) {
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { print("bad url"); return }
        guard let url = URL(string: "https://learnappmaking.com/ex/users.json") else { print("bad url"); return }

        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            // check error
            guard error == nil,
                  let data = data
            else { print("Client error"); return }

            // check response
            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode)
            else { print("Server error"); return }

            // check mime type
            guard response.mimeType == "application/json" else { print("Wrong MIME type"); return }

            // check data and decode
            let decoder = JSONDecoder()
            do {
                let posts = try decoder.decode([Person].self, from: data)
                posts.forEach { print($0) }
            } catch {
                print(error.localizedDescription)
            }
            
            
            
            
        })
    
        task.resume()
    }
    
}

