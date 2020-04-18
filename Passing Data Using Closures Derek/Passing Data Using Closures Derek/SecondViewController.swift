//
//  SecondViewController.swift
//  Passing Data Using Closures Derek
//
//  Created by Jason Pinlac on 4/18/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var sendDataButton: UIButton!
    
    var onCancel: (()->Void)?
    var onSendData: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Second View Controller"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped(_:)))
        
        sendDataButton.addTarget(self, action: #selector(sendDataTapped(_:)), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        inputTextField.becomeFirstResponder()
    }
    
    
    @objc func sendDataTapped(_ sender: UIButton) {
        guard let text = inputTextField.text else { return }
        onSendData?(text)
    }
    
    @objc func cancelTapped(_ sender: UIBarButtonItem) {
        inputTextField.resignFirstResponder()
        onCancel?()
    }
}
