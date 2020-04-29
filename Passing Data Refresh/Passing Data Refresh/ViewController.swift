//
//  ViewController.swift
//  Passing Data Refresh
//
//  Created by Jason Pinlac on 4/27/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textLabel: UILabel!
    @IBOutlet var delegateButton: UIButton!
    @IBOutlet var closureButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Update me"
        delegateButton.backgroundColor = UIColor.systemRed
        delegateButton.setTitleColor(UIColor.label, for: .normal)
        closureButton.backgroundColor = UIColor.systemBlue
        closureButton.setTitleColor(UIColor.label, for: .normal)
        
        
        delegateButton.addTarget(self, action: #selector(delegateButtonTapped(_:)), for: .touchUpInside)
        closureButton.addTarget(self, action: #selector(closureButtonTapped(_:)), for: .touchUpInside)
    }

    @objc func delegateButtonTapped(_ sender: UIButton) {
        let id = String(describing: DelegateViewController.self)
        if let delegateViewController = storyboard?.instantiateViewController(identifier: id) as? DelegateViewController {
            delegateViewController.delegate = self
            let naviationController = UINavigationController(rootViewController: delegateViewController)
            present(naviationController, animated: true)
        }
    }
    
    @objc func closureButtonTapped(_ sender: UIButton) {
        let id = String(describing: ClosureViewController.self)
        if let closureViewController = storyboard?.instantiateViewController(identifier: id) as? ClosureViewController {
            
            closureViewController.saveClosure = { [weak self] text in
                self?.textLabel.text = text
                self?.dismiss(animated: true)
            }
            
            closureViewController.cancelClosure = { [weak self] in
                self?.dismiss(animated: true)
            }
            
            let navigationController = UINavigationController(rootViewController: closureViewController)
            present(navigationController, animated: true)
        }
    }

}

extension ViewController: DelegateViewControllerDelegate {
    func getText(text: String) {
        textLabel.text = text
        self.dismiss(animated: true)
    }
    
    func cancel() {
        self.dismiss(animated: true)
    }
}

