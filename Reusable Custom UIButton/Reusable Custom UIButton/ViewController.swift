//
//  ViewController.swift
//  Reusable Custom UIButton
//
//  Created by Jason Pinlac on 4/22/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var bottomButton = CustomButton(buttonTitle: "Shake me")

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBottomButtonConstraints()
        addActionToBottomButton()
    }
    
    
    func setupBottomButtonConstraints() {
        view.addSubview(bottomButton)
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomButton.heightAnchor.constraint(equalToConstant: 50),
            bottomButton.widthAnchor.constraint(equalToConstant: 280),
            bottomButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200)
        ])
    }
    
    func addActionToBottomButton() {
        bottomButton.addTarget(self, action: #selector(bottomButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc func bottomButtonTapped(_ sender: CustomButton) {
        sender.shake()
    }

    @IBAction func topButtonTapped(_ sender: CustomButton) {
        sender.shake()
    }
    
}

