//
//  ViewController.swift
//  FilterReduceMap
//
//  Created by Yashom on 19/09/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    var models = [String]()

    fileprivate func setupModels() {
        models.append("ankan")
        models.append("aryan")
        models.append("aman")
        models.append("arjun")
        models.append("ankit")
        models.append("dan")
        models.append("dahush")
        models.append("dev")
        models.append("devakar")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        setupModels()
        table.dataSource = self
        
    }
    
    
    
    @IBAction func didTapSegment(_ sender: UISegmentedControl){
        models.removeAll()
        setupModels()
        
        if sender.selectedSegmentIndex == 1{
            models = models.filter({ $0.starts(with: "a")})
        }
        else if sender.selectedSegmentIndex == 2{
            models = models.filter({ $0.starts(with: "d")})
        }
        
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row]
        return cell
    }


}

