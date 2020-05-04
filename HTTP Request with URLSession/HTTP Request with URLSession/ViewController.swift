//
//  ViewController.swift
//  HTTP Request with URLSession
//
//  Created by Jason Pinlac on 5/3/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var posts = [Post]()
    
    // initialize and configure the button
//    lazy var APICallButton: UIButton = { () -> UIButton in
//        let button = UIButton(type: .system)
//        button.backgroundColor = UIColor.systemBlue
//        button.setTitle("Make API Call", for: .normal)
//        button.setTitleColor(UIColor.white, for: .normal)
//        button.layer.cornerRadius = 20
//        button.layer.borderColor = UIColor.lightGray.cgColor
//        button.layer.borderWidth = 2
//        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Posts"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Get Posts", style: .plain, target: self, action: #selector(getPostsTapped(_:)))
        
        // Do any additional setup after loading the view.
        
//        APICallButton.addTarget(self, action: #selector(makeAPICallButtonTapped(_:)), for: .touchUpInside)
//
//        view.addSubview(APICallButton)
//        NSLayoutConstraint.activate([
//            APICallButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
//            APICallButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
//            APICallButton.widthAnchor.constraint(equalToConstant: 200),
//            APICallButton.heightAnchor.constraint(equalToConstant: 100)
//        ])
    }
    
    @objc func getPostsTapped(_ sender: UIBarButtonItem) {
        DispatchQueue.global(qos: .userInteractive).async {
            if let url = URL(string: "https://jsonplaceholder.typicode.com/posts") {
                let session = URLSession.shared
                let task = session.dataTask(with: url, completionHandler: { [weak self] data, response, error in
                    do{
                        self?.posts = try JSONDecoder().decode([Post].self, from: data!)
                        DispatchQueue.main.async {
                            self?.tableView.reloadData()
                        }
                    } catch {
                        print("Error during JSON serialization: \(error.localizedDescription)")
                    }
                })
                task .resume()
            }
        }
       }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.detailTitle = posts[indexPath.row].title
        detailViewController.detailBody = posts[indexPath.row].body
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    

//    @objc func makeAPICallButtonTapped(_ sender: UIButton) {
//
//        if let url = URL(string: "https://jsonplaceholder.typicode.com/posts") {
//            let session = URLSession.shared
//            let task = session.dataTask(with: url, completionHandler: { [weak self] data, response, error in
//                do{
//                    self?.posts = try JSONDecoder().decode([Post].self, from: data!)
//                    print(self?.posts ?? "nada")
//                } catch {
//                    print("Error during JSON serialization: \(error.localizedDescription)")
//                }
//            })
//            task .resume()
//        }
//
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Post", for: indexPath)
        cell.textLabel?.text = String(posts[indexPath.row].id) + " " + posts[indexPath.row].title
        cell.detailTextLabel?.text = posts[indexPath.row].body
        return cell
    }
    
    
}



