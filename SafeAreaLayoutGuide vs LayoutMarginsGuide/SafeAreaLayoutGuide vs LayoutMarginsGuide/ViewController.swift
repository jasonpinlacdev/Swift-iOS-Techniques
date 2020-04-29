//
//  ViewController.swift
//  SafeAreaLayoutGuide vs LayoutMarginsGuide
//
//  Created by Jason Pinlac on 4/29/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Safe Area VS Layout Margin"
        
        view.backgroundColor = UIColor.yellow
        
        navigationController?.navigationBar.isTranslucent = true
        
        
        // Label 1 will touch to safe area layout guide
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.textColor = UIColor.white
        label1.backgroundColor = UIColor.systemRed
        
        label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        label1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        label1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        label1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    
        
        // Label 2 will touch the layout margin guide
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.textColor = UIColor.white
        label2.backgroundColor = UIColor.systemBlue
        
        label2.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10).isActive = true
        label2.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -10).isActive = true
        label2.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        label2.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        
        label1.addSubview(label2)
        
        
        
    }
    
    
}

