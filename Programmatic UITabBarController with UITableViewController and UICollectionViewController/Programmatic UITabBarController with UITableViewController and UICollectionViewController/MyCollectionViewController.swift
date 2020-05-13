//
//  MyCollectionViewController.swift
//  Programmatic UITabBarController with UITableViewController and UICollectionViewController
//
//  Created by Jason Pinlac on 5/12/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit



class MyCollectionViewController: UICollectionViewController {
    
    private let cellReuseID = "collectionCell"
    
    private let names = ["Jason", "David", "Mike", "Tyler", "Annina", "Jose"]

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseID)
    }
    
}


extension MyCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseID, for: indexPath) as? MyCollectionViewCell else { fatalError() }
        cell.customTextField.text = names[indexPath.item]
        return cell
    }
}

extension MyCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
}



class MyCollectionViewCell: UICollectionViewCell {
    
    lazy var customTextField: UITextField = {
        let textField = UITextField()
        print("customTextField created")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureCell()
    }
    
    func configureCell() {
        addSubview(customTextField)
        backgroundColor = .systemRed
        layer.cornerRadius = 15
        NSLayoutConstraint.activate([
            customTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            customTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
}




