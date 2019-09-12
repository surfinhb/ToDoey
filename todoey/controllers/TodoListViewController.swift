//
//  ViewController.swift
//  todoey
//
//  Created by Jake Shapiro on 8/31/19.
//  Copyright © 2019 Jake Shapiro. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController{
    
    var itemArray = [Item]()
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        decodeData()
        
        print(dataFilePath)
    }
    
    // amount of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    // loading rows with proper cell at indexPath
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoeyCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].text
        cell.accessoryType = itemArray[indexPath.row].check ? .checkmark : .none
        return cell
    }
    
    // If row was selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        itemArray[indexPath.row].check = !itemArray[indexPath.row].check
        //let cell = tableView.cellForRow(at: indexPath)
        
        //cell?.accessoryType = item.check ? .none : .checkmark
        //item.check = !item.check
        encodeData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    
    }
    
    @IBAction func addItem(_ sender: Any) {
        var enteredText = UITextField()
        let alert = UIAlertController(title: "Add new todoey item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add item", style: .default) { (UIAlertAction) in
            
            let item = Item(enteredText.text!)
            self.itemArray.append(item)
            
            self.encodeData()
            
        }
        alert.addTextField { (textField) in
            enteredText = textField
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func encodeData(){
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
        } catch {
            print(error)
        }
        self.tableView.reloadData()
    }
    
    func decodeData(){
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
                itemArray = try decoder.decode([Item].self , from: data)
            } catch {
                print(error)
            }
        }
        
    }
    
}

