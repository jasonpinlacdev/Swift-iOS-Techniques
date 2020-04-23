//
//  CustomButton.swift
//  Reusable Custom UIButton
//
//  Created by Jason Pinlac on 4/22/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//


import UIKit


class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    // this initializer below is needed for storybaord purposes
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    convenience init(buttonTitle: String) {
        self.init()
        self.setTitle(buttonTitle, for: .normal)
    }
    
    
    private func configure() {
        setShadow()
        self.setTitleColor(.label, for: .normal)
        self.backgroundColor    = UIColor.systemBlue
        self.titleLabel?.font   = UIFont.systemFont(ofSize: 18)
        self.layer.cornerRadius = 25
        self.layer.borderWidth  = 3.0
        self.layer.borderColor  = UIColor.darkGray.cgColor
    }
    
    
    private func setShadow() {
        self.layer.shadowColor   = UIColor.black.cgColor
        self.layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
        self.layer.shadowRadius  = 8
        self.layer.shadowOpacity = 0.5
        self.clipsToBounds       = true
        self.layer.masksToBounds = false
    }
    
    
    func shake() {
        let shake           = CABasicAnimation(keyPath: "position")
        shake.duration      = 0.1
        shake.repeatCount   = 2
        shake.autoreverses  = true
        
        let fromPoint       = CGPoint(x: self.center.x - 8, y: self.center.y)
        let fromValue       = NSValue(cgPoint: fromPoint)
        
        let toPoint         = CGPoint(x: self.center.x + 8, y: self.center.y)
        let toValue         = NSValue(cgPoint: toPoint)
        
        shake.fromValue     = fromValue
        shake.toValue       = toValue
        
        self.layer.add(shake, forKey: "position")
    }
}
