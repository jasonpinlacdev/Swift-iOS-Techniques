//
//  DetailViewController.swift
//  4 Storyboard ways to pass data UITableView to DetailViewController
//
//  Created by Jason Pinlac on 10/20/20.
//

import UIKit

class DetailViewController: UIViewController {

    var brother: String?

    @IBOutlet var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel?.text = brother
    }
    
    init?(coder: NSCoder, brother: String?) {
        self.brother = brother
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
