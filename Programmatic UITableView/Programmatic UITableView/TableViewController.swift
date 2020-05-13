//
//  TableViewExample.swift
//  Programmatic UITableView
//
//  Created by Jason Pinlac on 5/12/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    
}

extension TableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Hello, world!"
        return cell
    }
}


        // MARK: - When to use dequeueReusableCellWithIdentifier vs dequeueReusableCellWithIdentifier : forIndexPath
//        The most important difference is that the forIndexPath: version asserts (crashes) if you didn't register a class or nib for the identifier. The older (non-forIndexPath:) version returns nil in that case.
//
//        You register a class for an identifier by sending registerClass:forCellReuseIdentifier: to the table view. You register a nib for an identifier by sending registerNib:forCellReuseIdentifier: to the table view.
//
//        If you create your table view and your cell prototypes in a storyboard, the storyboard loader takes care of registering the cell prototypes that you defined in the storyboard.
        

/*
 
 // 1st way
 override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
     cell?.textLabel?.text = "dequeued"
     if cell == nil {
         cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
         cell?.textLabel?.text = "created"
     }
     return cell!
 }
 
 
 //2nd way
 override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? UITableViewCell {
         cell.textLabel?.text = "dequeued"
         return cell
     } else {
         let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
         cell.textLabel?.text = "created"
         return cell
     }
 }
 
 //3rd way
 override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
     cell.textLabel?.text = "Hello, world!"
     return cell
 }
 
 
 
 */
