//
//  CustomCollectionViewCell.swift
//  Programmatic UICollectionView
//
//  Created by Jason Pinlac on 5/12/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    lazy var customTextField: UITextField = {
        let label = UITextField()
        label.text = "Custom Text"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureCell() {
        addSubview(customTextField)
        
        backgroundColor = .systemRed
        self.layer.cornerRadius = 20
        
        NSLayoutConstraint.activate([
            customTextField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            customTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            customTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
}

