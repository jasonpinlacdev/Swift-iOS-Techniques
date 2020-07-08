//
//  ViewController.swift
//  Networking in Swift the Right Way
//
//  Created by Jason Pinlac on 7/6/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUI()
    }
    
    func configureUI() {
        imageView = UIImageView()
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            imageView.widthAnchor.constraint(equalToConstant: 300),
        ])
        
        
        // Don’t use this synchronous method to request network-based URLs. For network-based URLs, this method can block the current thread for tens of seconds on a slow network, resulting in a poor user experience, and in iOS, may cause your app to be terminated.
        
        // This is a synchronous method and can block the main thread stalling your app while downloading the JPEG over the network call.
        if let imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/1/1a/Arthur%2C_the_cat.jpg") {
            if let imageData = try? Data(contentsOf: imageURL) {
                imageView.image = UIImage(data: imageData)
            }
        }
        
         //Data(contentsOf:), it has its place, and it’s wonderful. This method is meant for Local and App resources only
        if let fileURL = Bundle.main.url(forResource: "wishList", withExtension: "txt") {
            if let fileData = try? Data(contentsOf: fileURL) {
                if let fileString = String(data: fileData, encoding: .utf8) {
                    print(fileString)
                }
            }
        }
        
        imageView.image = nil
        
        // The correct way of getting remote resources is using URLSession. This is done on a background thread asynchronously so it wont block the main thread.
        let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/1/1a/Arthur%2C_the_cat.jpg")!
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { [weak self] data, response, error in
            // check error. client error
            guard error == nil else { return }
            
            // convert response to http url response
            if let httpResponse = response as? HTTPURLResponse {
                
                // check status code of http response. server error
                let acceptableStatusCodes = [200, 201, 202, 203, 304]
                guard acceptableStatusCodes.contains(httpResponse.statusCode) else { return }
                    
                // check and unwrapp data
                if let receviedData = data {
                    
                    // display the UIImage on the main thread
                    DispatchQueue.main.async {
                        self?.imageView.image = UIImage(data: receviedData)
                    }
                    
                }
            }
        }
        task.resume()
        
        
    }


}

