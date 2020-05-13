//
//  MyTableViewController.swift
//  Programmatic UITabBarController with UITableViewController and UICollectionViewController
//
//  Created by Jason Pinlac on 5/12/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    
    private let cellReuseID = "tableCell"
    
    private let names = ["Jason", "David", "Mike", "Tyler", "Annina", "Jose"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseID)
    }

}

extension MyTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID, for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
}
