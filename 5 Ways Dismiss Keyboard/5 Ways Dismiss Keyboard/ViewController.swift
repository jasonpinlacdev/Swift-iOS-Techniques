//
//  ViewController.swift
//  5 Ways Dismiss Keyboard
//
//  Created by Jason Pinlac on 10/21/20.
//

// MARK: - 5 WAYS TO DISMISS A KEYBOARD
// 1) Implement the textFieldShouldReturn delegate for the textField
// 2) If a textField can't use its return key, add a UIToolBar on top of the keyboard with a done button that uses a target and selector function to call view.endEditing()
// 3) Add a tap gesture recognizer that calls the UIView.endEditing(_:) functions
// 4) Override the touches began method and call view.endEditing()

// 5) OPTIONAL - You can adjust the view origin when the keyboard comes up so that it doesn't block your textfield or textfields. Take advantage of iOS sending a notification when the keyboard is shown on screen. UIResponder.keyboadWillShowNotification. add an observer IE NotificationCenter.defaultaddObserver(...)

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var displayNameTextField: UITextField!
    
    var activeTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configure()
        addTapGestureRecognizer()
        addObserversForKeyboard()
    }
    
    private func configure() {
        // MARK: - #1 -
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.delegate = self
        displayNameTextField.delegate = self
        
        // MARK: - #2 -
        usernameTextField.addButton(title: "Done", target: self, selector: #selector(textFieldDoneButtonTapped))
        passwordTextField.addButton(title: "Done", target: self, selector: #selector(textFieldDoneButtonTapped))
        emailTextField.addButton(title: "Done", target: self, selector: #selector(textFieldDoneButtonTapped))
        displayNameTextField.addButton(title: "Done", target: self, selector: #selector(textFieldDoneButtonTapped))
    }
    
    // MARK: - #2 -
    @objc func textFieldDoneButtonTapped() {
        self.view.endEditing(true)
    }
    
    // MARK: - #3 -
    private func addTapGestureRecognizer() {
        let tapToEndEditing = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        self.view.addGestureRecognizer(tapToEndEditing)
    }
    
    // MARK: - #4 -
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - #5 -
    private func addObserversForKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - #5 -
    @objc func keyboardWillShow(notification: NSNotification) {
        // check if the text field will be covered by the keyboard when the keyboard appears. If it will be covered , then move the whole view up; if not, then just leave the view as it is.
        
        // First we get the bottomY value of the textfield (the bottom edge of the textfield), and compare it to the visible range (the screen area that is still visible after keyboard is presented). If the bottomY value is larger than the visible range (ie. the bottomY value of textfield is larger than the bottomY value of visible range), then only we move the view up.
        
        //  If there are multiple textfields on the screen, how do we get the bottomY of the current selected textfield by the user? We can declare a variable to keep track of the current active textfield, say activeTextField, and assign the selected textfield to this variable when user select a textfield. We set the textfield delegate to self (to the view controller), and we listen to when user select a textfield in the UITextFieldDelegate function, textFieldDidBeginEditing. And then we compare the activeTextField's maxY (bottomY) value to the visibleRange in the keyboardWillShow function
        guard let keyboardFrameInfo = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
              let activeTextField = self.activeTextField
        else { return }
        
        let bottomOfTextField = activeTextField.convert(activeTextField.frame, to: self.view).maxY
        
        let keyboardSize = keyboardFrameInfo.cgRectValue
        let topOfKeyboard = self.view.frame.height - keyboardSize.height
        
        let amountToMoveUp = topOfKeyboard - bottomOfTextField
        
        if bottomOfTextField > topOfKeyboard {
            self.view.frame.origin.y = amountToMoveUp
        }
        
    }
    
    // MARK: - #5 -
    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
        self.activeTextField = nil
    }
    
}


extension ViewController: UITextFieldDelegate {
    // MARK: - #1 -
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // the first responder of the textFeild when tapped is the keyboard
        textField.resignFirstResponder()
    }
    
    // MARK: - #5 -
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }
    
}

extension UITextField {
    // MARK: - #2 -
    func addButton(title: String, target: Any?, selector: Selector?) {
        let toolbar = UIToolbar()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: title, style: .plain, target: target, action: selector)
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        toolbar.sizeToFit()
        self.inputAccessoryView = toolbar
    }
}
