//
//  DelegateViewController.swift
//  Passing Data Between View Controllers Using Protocol Delegate and Closures
//
//  Created by Jason Pinlac on 4/20/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit


protocol DelegateViewControllerDelegate {
    func delegateViewControllerSendData(data: String)
    func delegateViewControllerCancel()
}

class DelegateViewController: UIViewController {
    
    var delegate: DelegateViewControllerDelegate?
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Delegate View Controller"
        textField.delegate = self
        saveButton.addTarget(self, action: #selector(saveTapped(_:)), for: .touchUpInside)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped(_:)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        textField.becomeFirstResponder()
    }
    
    @objc func saveTapped(_ sender: UIButton) {
        guard let text = textField.text else { return }
        delegate?.delegateViewControllerSendData(data: text)
    }
    
    @objc func cancelTapped(_ sender: UIBarButtonItem) {
        textField.resignFirstResponder()
        delegate?.delegateViewControllerCancel()
    }
    
}


extension DelegateViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
