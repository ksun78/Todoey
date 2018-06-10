//
//  ViewController.swift
//  Todoey
//
//  Created by Kevin Sun on 4/12/18.
//  Copyright © 2018 Kevin Sun. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Buy Eggos"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Destroy Demogorgon"
        itemArray.append(newItem3)
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        
//        item.done == true ? cell.accessoryType = .checkmark : cell.accessoryType = .none
        cell.accessoryType = item.done ? .checkmark : .none
        
        if itemArray[indexPath.row].done == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])

        
        itemArray[indexPath.row].done = !(itemArray[indexPath.row].done)
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK - Add new items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new todo item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what happens once user clicks the addItem button on our UIAlert
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
//    func tester () {
//
//        let dictKey = "MyDict"
//
//        let userDefaults = UserDefaults.standard
//        userDefaults.set(0.24, forKey: "Volume")
//        userDefaults.set(true, forKey: "MusicOn")
//        userDefaults.set("Kevin", forKey: "PlayerName")
//        userDefaults.set(Date(), forKey: "AppLastOpened")
//        let array = [1, 2, 3]
//        let dict = ["name": "Kevin"]
//        userDefaults.set(dict, forKey: dictKey)
//
//        userDefaults.set(array, forKey: "MyArray")
//
//
//
//        let volume = defaults.float(forKey: "Volume")
//        let appLastOpen = userDefaults.object(forKey: "AppLastOpened")
//        let myArray = userDefaults.array(forKey: "MyArray") as! [Int]
//        let myDict = userDefaults.dictionary(forKey: dictKey)
//  }
    
    
    
    

}

