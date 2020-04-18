//
//  ViewController.swift
//  Passing Data Using Closures Derek
//
//  Created by Jason Pinlac on 4/18/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var displayLabel: UILabel!
    @IBOutlet var getDataButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataButton.addTarget(self, action: #selector(getDataTapped(_:)), for: .touchUpInside)
    }

    @objc func getDataTapped(_ sender: UIButton) {
        let identifier = String(describing: SecondViewController.self)
        if let secondViewController = storyboard?.instantiateViewController(identifier: identifier) as? SecondViewController {
            
            secondViewController.onSendData = { [weak self] data in
                self?.displayLabel.text = data
                self?.dismiss(animated: true)
            }
            secondViewController.onCancel = { [weak self] in
                self?.dismiss(animated: true)
            }
            
            let navigationController = UINavigationController(rootViewController: secondViewController)
            present(navigationController, animated: true)
        }
       
    }

}

