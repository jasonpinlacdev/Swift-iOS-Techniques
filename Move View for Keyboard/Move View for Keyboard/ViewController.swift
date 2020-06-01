//
//  ViewController.swift
//  Move View for Keyboard
//
//  Created by Jason Pinlac on 6/1/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activeTextField: UITextField?
    
    
    let topTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Top UITextField"
        textField.font = UIFont.systemFont(ofSize: 30, weight: .thin)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.size.height))
        textField.leftViewMode = .always
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.systemGray2.cgColor
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        return textField
    }()
    
    
    let bottomTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Bottom UITextField"
        textField.font = UIFont.systemFont(ofSize: 30, weight: .thin)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.size.height))
        textField.leftViewMode = .always
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.systemGray2.cgColor
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        return textField
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUILayout()
        configureObserverKeyboardNotifications()
        configureToHideKeyboardOnTapOnView()
    }
    
    
    private func configureUILayout() {
        view.backgroundColor = .systemBackground
        
        topTextField.delegate = self
        bottomTextField.delegate = self
        
        view.addSubview(topTextField)
        view.addSubview(bottomTextField)
        
        
        NSLayoutConstraint.activate([
            topTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.size.height/4),
            topTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            topTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            topTextField.heightAnchor.constraint(equalToConstant: 60),
            
            bottomTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.size.height/4),
            bottomTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            bottomTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            bottomTextField.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    
    private func configureToHideKeyboardOnTapOnView()
    {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    
    private func configureObserverKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        
        guard let activeTextField = activeTextField else { return }
        
        var shouldMoveUp = false
        
        let bottomOfActiveTextField = activeTextField.convert(activeTextField.bounds, to: view).maxY
        let topOfKeyboard = view.frame.height - keyboardFrame.size.height
        
        if bottomOfActiveTextField > topOfKeyboard {
            shouldMoveUp = true
        }
        
        if shouldMoveUp {
            view.frame.origin.y = 0 - keyboardFrame.size.height
        }
    }
    
    
    @objc func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
    }
    
}



extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        activeTextField = nil
    }
}
