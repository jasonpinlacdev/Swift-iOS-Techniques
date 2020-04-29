//
//  ClosureViewController.swift
//  Passing Data Refresh
//
//  Created by Jason Pinlac on 4/27/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class ClosureViewController: UIViewController {
    
    var cancelClosure: (()->Void)?
    var saveClosure: ((String)->Void)?
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Closure View Controller"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped(_:)))
        
        saveButton.backgroundColor = UIColor.systemBlue
        saveButton.setTitleColor(UIColor.white, for: .normal)
        saveButton.addTarget(self, action: #selector(saveButtonTapped(_:)), for: .touchUpInside)
        
        textField.delegate = self
        textField.becomeFirstResponder()
    }
    
    @objc func cancelButtonTapped(_ sender: UIBarButtonItem) {
        textField.resignFirstResponder()
        cancelClosure?()
    }
    
    @objc func saveButtonTapped(_ sender: UIButton) {
        textField.resignFirstResponder()
        guard let text = textField.text else { return }
        saveClosure?(text)
    }

}

extension ClosureViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
