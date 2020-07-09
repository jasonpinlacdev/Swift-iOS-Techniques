//
//  ViewController.swift
//  Custom UITableViewCell Programmatically
//
//  Created by Jason Pinlac on 7/7/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var products = [Product]()
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configure()
        createProductsArray()
        configureTableView()
        
    }
    
    
    func configure() {
        title = "Custom UITableViewCell"
    }
    
    func configureTableView() {
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.cellID)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: nil, height: nil, enableInsets: false)
    }
    
    
    private func createProductsArray() {
        products.append(Product(productName: "Glasses", productImage: UIImage(named: "glasses")!, productDescription: "Ray-Ban", quantity: 1))
        products.append(Product(productName: "Camera", productImage: UIImage(named: "camera")!, productDescription: "Cannon", quantity: 1))
        products.append(Product(productName: "Breakfast", productImage: UIImage(named: "breakfast")!, productDescription: "All natural medley", quantity: 1))
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.cellID, for: indexPath) as? ProductTableViewCell else { fatalError() }
        cell.product = products[indexPath.row]
        cell.delegate = self
        return cell
    }
}


extension ViewController: ProductTableViewCellDelegate {
    func increaseButtonTapped(cell: ProductTableViewCell) {
        if var quantity = cell.product?.quantity {
            quantity += 1
            cell.product?.quantity = quantity
            cell.productQuantity.text = "\(quantity)"
        }
    }
    
    func decreaseButtonTapped(cell: ProductTableViewCell) {
        if var quantity = cell.product?.quantity {
            quantity -= 1
            cell.product?.quantity = quantity
            cell.productQuantity.text = "\(quantity)"
        }
    }
}

