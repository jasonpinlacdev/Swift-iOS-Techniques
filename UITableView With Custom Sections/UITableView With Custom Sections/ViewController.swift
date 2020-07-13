//
//  ViewController.swift
//  UITableView With Custom Sections
//
//  Created by Jason Pinlac on 7/10/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let cellId = "cellId"
    
    var allNames = [
        ["Jason", "Mike", "Davy", "Gus", "TK", "Dan", "Harry", "Tyler"],
        ["Chico", "Giubi", "Daisy"],
        ["Penny"],
        ["Anna", "Jose"],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        self.title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show Index Path", style: .plain, target: self, action: #selector(handleShowIndexPath))
    }
    
    @objc func handleShowIndexPath() {
        
    }
   
    
}

extension ViewController {
    // These two methods here are for setting up the sections
       override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let label = UILabel()
           label.text = "Header"
           label.backgroundColor = .lightGray
           return label
       }
       
       override func numberOfSections(in tableView: UITableView) -> Int {
           return allNames.count
       }
       
       
       
       // these two methods here are for setting up the rows within the section
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return allNames[section].count
       }
       
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
           let name = allNames[indexPath.section][indexPath.row]
           cell.textLabel?.text = "\(name), Section: \(indexPath.section), Row: \(indexPath.row)"
           return cell
       }
}
