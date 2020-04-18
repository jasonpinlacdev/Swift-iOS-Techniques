//
//  SecondViewController.swift
//  Passing Data Delegate Protocol
//
//  Created by Jason Pinlac on 4/17/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit


protocol DataSendingDelegateProtocol {
    func receive(data: String)
}

class SecondViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var sendDataButton: UIButton!
    
    var delegate: DataSendingDelegateProtocol?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Second View Controller"
        sendDataButton.backgroundColor = UIColor.systemBlue
        sendDataButton.setTitleColor(UIColor.white, for: .normal)
        sendDataButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        sendDataButton.sizeToFit()
        
        textField.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    
    @IBAction func sendDataButtonPressed(_ sender: Any) {
        guard let delegate = delegate else { return }
        guard let text = textField.text else { return }
        delegate.receive(data: text)
    }
    
}

extension SecondViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
