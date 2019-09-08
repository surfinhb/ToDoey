//
//  ViewController.swift
//  todoey
//
//  Created by Jake Shapiro on 8/31/19.
//  Copyright © 2019 Jake Shapiro. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController{
    
    let itemArray = ["eggs", "waffles", "cereal"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoeyCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        let cell = tableView.cellForRow(at: indexPath)
        
        
        if cell?.accessoryType == .checkmark {
            cell?.accessoryType = .none
        } else {
            cell?.accessoryType = .checkmark
        }
    
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

