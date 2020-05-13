//
//  ViewController.swift
//  Programmatic UICollectionView
//
//  Created by Jason Pinlac on 5/12/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit




class CustomCollectionViewController: UICollectionViewController {
    
    let cellReuseID = "cell"
    let names = ["Jason Pinlac", "Tyler Byrd", "Annina Biasone", "David Pinlac", "Michael Pinlac", "Jose Pinlac"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Collection View"
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseID)
    }
    
}


extension CustomCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return names.count
       }
       
       
       override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseID, for: indexPath) as? CustomCollectionViewCell {
               cell.customTextField.text = names[indexPath.item]
               return cell
           } else {
               fatalError()
           }
       }
}


extension CustomCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
}





