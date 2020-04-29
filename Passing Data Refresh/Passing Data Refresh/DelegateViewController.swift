//
//  DelegateViewController.swift
//  Passing Data Refresh
//
//  Created by Jason Pinlac on 4/27/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit


protocol DelegateViewControllerDelegate {
    func getText(text: String)
    func cancel()
}

class DelegateViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var saveButton: UIButton!
    
    
    var delegate: DelegateViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Delegate View Controller"
        saveButton.backgroundColor = UIColor.systemRed
        saveButton.setTitleColor(UIColor.label, for: .normal)
        saveButton.addTarget(self, action: #selector(saveButtonTapped(_:)), for: .touchUpInside)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped(_:)))
        textField.delegate = self
        textField.becomeFirstResponder()
    }
    
    @objc func cancelTapped(_ sender: UIBarButtonItem) {
        textField.resignFirstResponder()
        delegate?.cancel()
    }
    
    @objc func saveButtonTapped(_ sender: UIButton) {
        guard let delegate = delegate else { return }
        guard let text = textField.text else { return }
        textField.resignFirstResponder()
        delegate.getText(text: text)
    }
    
}

extension DelegateViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
