//
//  ViewController.swift
//  3 Networking In Swift The Right Way
//
//  Created by Jason Pinlac on 10/27/20.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var APIButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        APIButton.layer.cornerRadius = 5.0
    }

    @IBAction func APIButtonTapped(_ sender: Any) {
        let endpoint = "https://upload.wikimedia.org/wikipedia/commons/1/1a/Arthur%2C_the_cat.jpg"
        guard let url = URL(string: endpoint) else { print("bad url"); return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard error == nil else { print("client error"); return }
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else { print("server error"); return }
            guard let data = data else { print("no data"); return}
            DispatchQueue.main.async {
                self?.imageView.image = UIImage(data: data)
            }
        }
        task.resume()
    }
    
}

