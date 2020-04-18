//
//  ViewController.swift
//  Passing Data Delegate Protocol Derek
//
//  Created by Jason Pinlac on 4/17/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    @IBOutlet var getDataButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDataButton.addTarget(self, action: #selector(getDataButtonTapped), for: .touchUpInside)
    }
    
    @objc func getDataButtonTapped() {
        let identifier = String(describing: SecondViewController.self)
        if let secondViewController = storyboard?.instantiateViewController(identifier: identifier) as? SecondViewController {
            
            secondViewController.delegate = self
            
            let navigationController = UINavigationController(rootViewController: secondViewController)
            
            present(navigationController, animated: true)
        }
    }
}


extension ViewController: SecondViewControllerDelegate {
    func sendDataPressed(data: String) {
        label.text = data
        dismiss(animated: true)
    }
    
    func cancelPressed() {
        dismiss(animated: true)
    }
}

