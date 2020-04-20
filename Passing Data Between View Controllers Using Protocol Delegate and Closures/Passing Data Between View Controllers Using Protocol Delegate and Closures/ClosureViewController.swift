//
//  ClosureViewController.swift
//  Passing Data Between View Controllers Using Protocol Delegate and Closures
//
//  Created by Jason Pinlac on 4/20/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class ClosureViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var saveButton: UIButton!
    
    var saveClosure: ((String) -> Void)?
    var cancelClosure: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Closure View Controller"
        
        saveButton.addTarget(self, action: #selector(savedTapped(_:)), for: .touchUpInside)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped(_:)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    @objc func savedTapped(_ sender: UIButton) {
        guard let text = textField.text else { return }
        saveClosure?(text)
    }
    
    @objc func cancelTapped(_ sender: UIBarButtonItem) {
        textField.resignFirstResponder()
        cancelClosure?()
    }
}
