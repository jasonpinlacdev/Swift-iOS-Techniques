//
//  ViewController.swift
//  Networking with URLSession
//
//  Created by Jason Pinlac on 5/20/21.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    performNetworkRequest()
  }
  
  func performNetworkRequest() {
    
    let configuration = URLSessionConfiguration.default
    configuration.waitsForConnectivity = true
    let session = URLSession(configuration: configuration)
    
    let url = URL(string: "https://gist.githubusercontent.com/reinder42/932d7671859959f6363b4d9b4e18bb91/raw/306631d79a5166bb0d86b12ac7d8cc42fecb996e/users.json")!
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    let task = session.dataTask(with: request) { data, urlResponse, error in
      if let data = data {
        if let persons = try? JSONDecoder().decode([Person].self, from: data) {
          persons.forEach {
            print($0)
          }
        }
      }
    }
    task.resume()
    
    
  }


}

