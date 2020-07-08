//
//  ViewController.swift
//  ProgrammaticLoginScreen
//
//  Created by Jason Pinlac on 7/6/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let loginContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.font = UIFont.preferredFont(forTextStyle: .title2)
        textField.textColor = .darkGray
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.font = UIFont.preferredFont(forTextStyle: .title2)
        textField.textColor = .darkGray
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemBlue
        button.tintColor = .yellow
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
        button.contentEdgeInsets = UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUIElementes()
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardValues = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardSize = keyboardValues.cgRectValue
        let keyboardHeight = keyboardSize.height
        
        // check if the keyboard will cover the login container view. To do this get the visible range of the view that the keyboard is not overlapping and compare this to the bottom of the login content view
        
        let visibleRange = view.frame.height - keyboardHeight
        let loginContentViewBottomY = loginContentView.convert(loginContentView.bounds, to: self.view).maxY;
        
        if loginContentViewBottomY > visibleRange {
            let differenceOfOverlap = loginContentViewBottomY - visibleRange
            view.frame.origin.y = -differenceOfOverlap - 20
        }
    }
    
    
    @objc func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
    }
    
    
    func configureUIElementes() {
        title = "Login Screen App"
        view.backgroundColor = .systemRed
        
        view.addSubview(loginContentView)
        
        loginContentView.addSubview(usernameTextField)
        loginContentView.addSubview(passwordTextField)
        loginContentView.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginContentView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            loginContentView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            loginContentView.heightAnchor.constraint(equalToConstant: view.bounds.height/3),
            loginContentView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            
            usernameTextField.topAnchor.constraint(equalTo: loginContentView.topAnchor, constant: 40),
            usernameTextField.leadingAnchor.constraint(equalTo: loginContentView.leadingAnchor, constant: 20),
            usernameTextField.trailingAnchor.constraint(equalTo: loginContentView.trailingAnchor, constant: -20),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: loginContentView.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: loginContentView.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            loginButton.leadingAnchor.constraint(equalTo: loginContentView.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: loginContentView.trailingAnchor, constant: -20),
        ])
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

