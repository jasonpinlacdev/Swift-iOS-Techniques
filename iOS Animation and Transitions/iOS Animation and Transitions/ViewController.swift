//
//  ViewController.swift
//  iOS Animation and Transitions
//
//  Created by Jason Pinlac on 12/15/20.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialHeart()
    }
    
    @IBAction func animateButtonTapped(_ sender: Any) {
        guard let animateButton = sender as? UIButton else { return }
        animateButton.isEnabled = false
        imageView.removeFromSuperview()
        
        imageView = UIImageView(image: UIImage(systemName: "heart.fill"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(container)
        container.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            imageView.heightAnchor.constraint(equalTo: container.heightAnchor),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            
            container.heightAnchor.constraint(equalToConstant: 300),
            container.widthAnchor.constraint(equalToConstant: 300),
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200),
        ])
        // when the constraints are activated, UIKit marks the UI as needing an update. So go ahead and force that UI update to get elements in position to being animation
        view.layoutIfNeeded()
        
        // you can get constraints as IBOutlets if using storyboard or if done programmatically you can use the identifier or constraints.first like the example below
        //
        //        if let constraints = imageView.superview?.constraints {
        //            let centerYConstraint = constraints.first(where: {
        //                constraint in
        //                constraint.firstItem === imageView && constraint.firstAttribute == .centerY
        //            })
        
        if let constraints = container.superview?.constraints {
            
            let centerYConstraint = constraints.first(where: {
                constraint in
                constraint.firstItem === container && constraint.firstAttribute == .centerY
            })
            
            // if your animating the multiplier of the constraint it doesn't have a get property so you have set the current constraints isActive = false. And then make the constraint IE constraint = NSLayoutConstaint(...) and set it to active
        
            UIView.animate(withDuration: 1, animations: {
                centerYConstraint?.constant = 0
                self.view.layoutIfNeeded()
            })
            
            // delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                // when transitioning you have to use a container around the view your flipping.
                UIView.transition(with: container, duration: 1.0, options: .transitionFlipFromBottom, animations: {
                    self.imageView.isHidden = true
                }, completion: { _ in
                    self.imageView.removeFromSuperview()
                    animateButton.isEnabled = true
                })
            })
            
        }
        
    }
    
    private func setupInitialHeart() {
        imageView = UIImageView(image: UIImage(systemName: "heart.fill"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            imageView.widthAnchor.constraint(equalToConstant: 300),
        ])
    }
    
}

