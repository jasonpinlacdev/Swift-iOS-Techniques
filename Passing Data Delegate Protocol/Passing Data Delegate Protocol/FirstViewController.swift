//
//  ViewController.swift
//  Passing Data Delegate Protocol
//
//  Created by Jason Pinlac on 4/17/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet var receivedDataLabel: UILabel!
    @IBOutlet var getDataButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "First View Controller"
        getDataButton.backgroundColor = UIColor.systemBlue
        getDataButton.setTitleColor(UIColor.white, for: .normal)
        getDataButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        getDataButton.sizeToFit()
        receivedDataLabel.sizeToFit()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "getDataSegue" {
            if let secondViewController = segue.destination as? SecondViewController {
                secondViewController.delegate = self
            }
        }
    }
}

extension FirstViewController: DataSendingDelegateProtocol {
    
    func receive(data: String) {
        receivedDataLabel.text = data
        dismiss(animated: true)
    }
}
