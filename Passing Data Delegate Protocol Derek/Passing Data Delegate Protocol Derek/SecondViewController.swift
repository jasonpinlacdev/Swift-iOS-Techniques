//
//  SecondViewController.swift
//  Passing Data Delegate Protocol Derek
//
//  Created by Jason Pinlac on 4/17/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate: class {
    func cancelPressed()
    func sendDataPressed(data: String)
}

class SecondViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var sendDataButton: UIButton!
    
    
    var delegate: SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SecondViewController"
        
        sendDataButton.addTarget(self, action: #selector(sendButtonTapped(_:)), for: .touchUpInside)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped(_:)))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    @objc func sendButtonTapped(_ sender: UIButton) {
        guard let text = textField?.text else { return }
        delegate?.sendDataPressed(data: text)
    }
    
    @objc func cancelButtonTapped(_ sender: UIBarButtonItem) {
        delegate?.cancelPressed()
    }
}
