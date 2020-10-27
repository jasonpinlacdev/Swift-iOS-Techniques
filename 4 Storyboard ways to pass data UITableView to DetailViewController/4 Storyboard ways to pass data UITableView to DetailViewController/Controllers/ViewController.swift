//
//  ViewController.swift
//  4 Storyboard ways to pass data UITableView to DetailViewController
//
//  Created by Jason Pinlac on 10/20/20.
//

// MARK: - 4 ways to pass data from a ViewController to a DetailViewController from a storyboard setup  -
// 1) OLD WAY: passing data to the detailViewController via storyboard segue and override prepare method (make sure segue is created from tableView cell to detailController). Uses a segue identifier
// 2) OLD WAY: passing data to detailViewController via UITableViewDelegate didSelectRowAt method and instantiation from storyboard id
// 3) NEW WAY: passing data to the detailViewController via @IBSegueAction (make sure segue is created from tableView cell to detailController and the outlet is connected)
// 4) NEW WAY: passing data to the storyboard detailViewController via the use of custom init?(coder: , ...) code. This is done in the didSelectRowAt method from UITableViewDelegate and the storyboard?.instantiateVieController(identifier: creator:) method.

import UIKit

class ViewController: UIViewController {
    
    var data = ["Jason", "Michael", "David"]
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Brothers"
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - NEW WAY: passing data to the detailViewController via @IBSegueAction (make sure segue is created from tableView cell to detailController and the outlet is connected) -
//    @IBSegueAction func showBrotherDetail(_ coder: NSCoder, sender: Any?, segueIdentifier: String?) -> DetailViewController? {
//        guard let indexPath = tableView.indexPathForSelectedRow else { fatalError("Could not get the indexPath for selected row.")}
//        let brotherData = data[indexPath.row]
//        return DetailViewController(coder: coder, brother: brotherData)
//    }
    
    // MARK: - OLD WAY: passing data to the detailViewController via storyboard segue and override prepare method (make sure segue is created from tableView cell to detailController) -
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "BrotherDetailSegue" {
//            guard let indexPath = tableView.indexPathForSelectedRow else { fatalError("Failed to get indexPath for the selected row.") }
//            let detailViewController = segue.destination as! DetailViewController
//            detailViewController.brother = data[indexPath.row]
//        }
//    }
    
}

extension ViewController: UITableViewDelegate {
    
    //MARK: - OLD WAY: passing data to detailViewController via UITableViewDelegate didSelectRowAt method and instantiation from storyboard id -
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let detailViewController = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else { return }
//        detailViewController.brother = data[indexPath.row]
//        navigationController?.pushViewController(detailViewController, animated: true)
//    }
    
    // MARK: - NEW WAY: passing data to the storyboard detailViewController via the use of custom init?(coder: , ...) code and didSelectRowAt from UITableViewDelegate -
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailViewController = storyboard?.instantiateViewController(identifier: "DetailViewController", creator: { [weak self] coder -> DetailViewController? in
            let brotherData = self?.data[indexPath.row]
            return DetailViewController(coder: coder, brother: brotherData)
        }) else { return }
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return data.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BrotherCell") else { fatalError("Failed to dequeue reusable BrothersCell") }
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    
}


