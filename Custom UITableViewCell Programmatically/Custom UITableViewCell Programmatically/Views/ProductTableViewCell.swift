//
//  ProductTableViewCell.swift
//  Custom UITableViewCell Programmatically
//
//  Created by Jason Pinlac on 7/9/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//


import UIKit

import UIKit


protocol ProductTableViewCellDelegate {
    func increaseButtonTapped(cell: ProductTableViewCell)
    func decreaseButtonTapped(cell: ProductTableViewCell)
}


class ProductTableViewCell: UITableViewCell {

    static let cellID = "ProductTableViewCell"
    var delegate: ProductTableViewCellDelegate?

    var product: Product? {
        didSet {
            productImage.image = product?.productImage
            productNameLabel.text = product?.productName
            productDescriptionLabel.text = product?.productDescription
            productQuantity.text = "\(product?.quantity ?? 0)"
        }
    }

    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()


    private let productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()


    private let decreaseButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "minusButton"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()


    private let increaseButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "plusButton"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()


    let productQuantity: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.text = "0"
        label.textColor = .gray
        return label
    }()


    private let productImage: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "glasses"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func configureLayout() {
        addSubview(productImage)
        addSubview(productNameLabel)
        addSubview(productDescriptionLabel)
        addSubview(decreaseButton)
        addSubview(productQuantity)
        addSubview(increaseButton)

        productImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 90, height: nil, enableInsets: false)
        productNameLabel.anchor(top: topAnchor, left: productImage.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: nil, enableInsets: false)
        productDescriptionLabel.anchor(top: productNameLabel.bottomAnchor, left: productImage.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: nil, enableInsets: false)

        let stackView = UIStackView(arrangedSubviews: [decreaseButton, productQuantity, increaseButton])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: productNameLabel.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 15, paddingLeft: 5, paddingBottom: 15, paddingRight: 10, width: nil, height: 70, enableInsets: false)
        
        decreaseButton.addTarget(self, action: #selector(decreaseButtonTapped), for: .touchUpInside)
        increaseButton.addTarget(self, action: #selector(increaseButtonTapped), for: .touchUpInside)
    }
    
    @objc func decreaseButtonTapped() {
        delegate?.decreaseButtonTapped(cell: self)
    }
    
    @objc func increaseButtonTapped() {
        delegate?.increaseButtonTapped(cell: self)
    }

}
