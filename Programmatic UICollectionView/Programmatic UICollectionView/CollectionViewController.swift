//
//  ViewController.swift
//  Programmatic UICollectionView
//
//  Created by Jason Pinlac on 5/12/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit


class CustomCollectionViewCell: UICollectionViewCell {
    
}

class CustomCollectionViewController: UICollectionViewController {
    
    let cellReuseID = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Collection View"
        collectionView.backgroundColor = .systemRed
        
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseID)
    }
    
}


extension CustomCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseID, for: indexPath)
        return cell
    }
}
