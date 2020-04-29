//
//  ViewController.swift
//  Custom Reusable Button Refresh
//
//  Created by Jason Pinlac on 4/27/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let bottomButton = CustomButton(type: .system)
    
    @IBOutlet var topButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        bottomButton.setTitle("Shake Bottom", for: .normal)
        bottomButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        bottomButton.addTarget(self, action: #selector(bottomButtonTapped(_:)), for: .touchUpInside)
        
        
        view.addSubview(bottomButton)
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomButton.widthAnchor.constraint(equalToConstant: 300),
            bottomButton.heightAnchor.constraint(equalToConstant: 50),
            bottomButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            bottomButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 200)
        ])
        
    }
    
    @objc func bottomButtonTapped(_ sender: CustomButton) {
        sender.shake()
    }
    
    
    @IBAction func topButtonTapped(_ sender: CustomButton) {
        sender.shake()
    }
    


}

