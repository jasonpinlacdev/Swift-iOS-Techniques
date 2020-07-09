//
//  UIView+EXT.swift
//  Custom UITableViewCell Programmatically
//
//  Created by Jason Pinlac on 7/9/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit
extension UIView {
 
 func anchor (top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat?, height: CGFloat?, enableInsets: Bool) {
 var topInset = CGFloat(0)
 var bottomInset = CGFloat(0)
 
// #available is going to check whether we're on deployment target iOS 11 or later, or any other unknown platforms that might get announced in the future – that's the * at the end, and it's required. And that's it:
 if #available(iOS 11, *), enableInsets {
 let insets = self.safeAreaInsets
 topInset = insets.top
 bottomInset = insets.bottom
 
 print("Top: \(topInset)")
 print("bottom: \(bottomInset)")
 }
 
 translatesAutoresizingMaskIntoConstraints = false
 
 if let top = top {
 self.topAnchor.constraint(equalTo: top, constant: paddingTop+topInset).isActive = true
 }
 if let left = left {
 self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
 }
 if let right = right {
 rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
 }
 if let bottom = bottom {
 bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom-bottomInset).isActive = true
 }
 if height != nil {
 heightAnchor.constraint(equalToConstant: height!).isActive = true
 }
 if width != nil {
 widthAnchor.constraint(equalToConstant: width!).isActive = true
 }
 
 }
 
}
