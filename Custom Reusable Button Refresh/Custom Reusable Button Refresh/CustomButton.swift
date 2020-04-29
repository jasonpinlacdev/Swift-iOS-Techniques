//
//  CustomButton.swift
//  Custom Reusable Button Refresh
//
//  Created by Jason Pinlac on 4/27/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    // overriding the init method for our child object. this is the designated init
    override init(frame: CGRect) {
        
        // this class property initializations need to go above the super init call for safety reasons. When a class object is instantiated all its properties must be initialized before passing control up the inheritance chain.
        super.init(frame: frame)
        // any other code thats not an initilization of a property can go below the super init call
        configure()
    }
    
    
    // this required init? is for instantiating an object if you use storyboard
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    // use convenience init like wrapper around the required init to execute additional code along side an initialization. convenience init must call a designated init
    
    
    private func configure() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        clipsToBounds = true
        
        backgroundColor = UIColor.systemRed
        setTitleColor(UIColor.label, for: .normal)
        
        layer.cornerRadius = 25
        layer.borderWidth = 3.0
        layer.borderColor = UIColor.darkGray.cgColor
    }
    
    func shake() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        shake.fromValue = NSValue(cgPoint: CGPoint(x: center.x - 8, y: center.y))
        shake.toValue = NSValue(cgPoint: CGPoint(x: center.x + 8, y: center.y))
        
        layer.add(shake, forKey: "position")
    }
    
    
}
