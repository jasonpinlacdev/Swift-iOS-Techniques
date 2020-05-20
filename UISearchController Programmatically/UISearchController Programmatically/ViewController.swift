//
//  ViewController.swift
//  UISearchViewController
//
//  Created by Jason Pinlac on 5/20/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var searchController: UISearchController!
    
    var textlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UISearchController"
        navigationController?.navigationBar.prefersLargeTitles = true
        configureSearchController()
        configureTextLabel()
    }
    
    func configureSearchController() {
        searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search something..."
        navigationItem.searchController = searchController
    }
    
    func configureTextLabel() {
        textlabel = UILabel()
        textlabel.translatesAutoresizingMaskIntoConstraints = false
        textlabel.layer.borderColor = UIColor.systemGray.cgColor
        textlabel.layer.borderWidth = 1
        textlabel.layer.cornerRadius = 7
        textlabel.clipsToBounds = true
        textlabel.numberOfLines = 0
        
        view.addSubview(textlabel)
        
        NSLayoutConstraint.activate([
            textlabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            textlabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            textlabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            textlabel.heightAnchor.constraint(equalToConstant: 35),
        ])
    }
    
}


extension ViewController: UISearchResultsUpdating {
    // This method gets called every time the user types anything into the search bar
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        textlabel.text = text
    }
}

