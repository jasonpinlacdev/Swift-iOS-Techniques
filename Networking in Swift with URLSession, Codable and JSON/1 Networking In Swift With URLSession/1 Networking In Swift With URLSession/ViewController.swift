//
//  ViewController.swift
//  1 Networking In Swift With URLSession
//
//  Created by Jason Pinlac on 10/27/20.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let session = URLSession.shared
        let endpoint = "https://learnappmaking.com/ex/users.json"
        guard let url = URL(string: endpoint) else {
            fatalError("URL endpoint is invalid")
        }
        
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
//            print("Data: \(data)")
//            print("Response: \(response)")
//            print("Error: \(error)")
            
            guard error == nil,
                  let data = data
            else {
                print("Client error")
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode)
            else {
                print("Server error")
                return
            }
            
            guard let mime = response.mimeType,
                  mime == "application/json"
            else {
                print("Wrong MIME type")
                return
            }

            do {
//                let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
                let decoder = JSONDecoder()
                if let people = try? decoder.decode([Person].self, from: data) {
                    people.forEach { print($0) }
                }
            } catch {
                print("Error: \(error.localizedDescription)")
            }

        })
        
        task.resume()
    }
    
    
}

