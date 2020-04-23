//
//  ViewController.swift
//  Passing Data Between View Controllers Using Protocol Delegate and Closures
//
//  Created by Jason Pinlac on 4/20/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var changMeLabel: UILabel!
    @IBOutlet var delegateButton: UIButton!
    @IBOutlet var closureButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Change Me"
        
        delegateButton.addTarget(self, action: #selector(delegateButtonTapped(_:)), for: .touchUpInside)
        
        closureButton.addTarget(self, action: #selector(closureButtonTapped(_:)), for: .touchUpInside)
    }
    
    
    @objc func delegateButtonTapped(_ sender: UIButton) {
        let id = String(describing: DelegateViewController.self)
        if let delegateViewController = storyboard?.instantiateViewController(identifier: id) as? DelegateViewController {
            
            delegateViewController.delegate = self
            
            let navController = UINavigationController(rootViewController: delegateViewController)
            
            present(navController, animated: true)
        }
    }
    
    
    @objc func closureButtonTapped(_ sender: UIButton) {
        let id = String(describing: ClosureViewController.self)
        if let closureViewController = storyboard?.instantiateViewController(identifier: id) as? ClosureViewController {
            
            closureViewController.saveClosure = { [weak self] text in
                self?.changMeLabel.text = text
                self?.dismiss(animated: true)
            }
            
            closureViewController.cancelClosure = { [weak self] in
                self?.dismiss(animated: true)
            }
            
            let navController = UINavigationController(rootViewController: closureViewController)
            present(navController, animated: true)
        }
    }

}


extension ViewController: DelegateViewControllerDelegate {
    func delegateViewControllerSendData(data: String) {
        changMeLabel.text = data
        dismiss(animated: true)
    }
    
    func delegateViewControllerCancel() {
        dismiss(animated: true)
    }
}
