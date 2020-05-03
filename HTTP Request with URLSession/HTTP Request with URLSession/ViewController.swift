//
//  ViewController.swift
//  HTTP Request with URLSession
//
//  Created by Jason Pinlac on 5/3/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var posts = [Post]()
    
    // initialize and configure the button
    lazy var APICallButton: UIButton = { () -> UIButton in
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.systemBlue
        button.setTitle("Make API Call", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 20
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 2
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        APICallButton.addTarget(self, action: #selector(makeAPICallButtonTapped(_:)), for: .touchUpInside)
        
        view.addSubview(APICallButton)
        NSLayoutConstraint.activate([
            APICallButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            APICallButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            APICallButton.widthAnchor.constraint(equalToConstant: 200),
            APICallButton.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    @objc func makeAPICallButtonTapped(_ sender: UIButton) {
        
        if let url = URL(string: "https://jsonplaceholder.typicode.com/posts") {
            let session = URLSession.shared
            let task = session.dataTask(with: url, completionHandler: { [weak self] data, response, error in
                do{
                    self?.posts = try JSONDecoder().decode([Post].self, from: data!)
                    print(self?.posts[0] ?? "nada")
                } catch {
                    print("Error during JSON serialization: \(error.localizedDescription)")
                }
            })
            task .resume()
        }
        
    }
}



