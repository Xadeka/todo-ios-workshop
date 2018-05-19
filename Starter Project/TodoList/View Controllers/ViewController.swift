//
//  ViewController.swift
//  TodoList
//
//  Created by Zade Kaakarni on 5/18/18.
//  Copyright © 2018 Xadeka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //TODO: Connect the Outlets from the storyboard here
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: Tell the table that you are going to handle it's data source and delegate methods
        
        
        //TODO: Tell the text field that you are going to handle it's delegate methods
        
        
    }
    
    //Mark: UITextFieldDelegate methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //TODO: Make a new task from the text field text
        
        
        //TODO: Add the new task to the data source

        
        //TODO: Tell table that it needs to add a new row
        
        
        //TODO: dismiss the keyboard
        
        
        //TODO: Clear the textfield for next task
        
        
        return true
    }
    
    //Mark: UITableViewDataSource
    
    //TODO: Create the model
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // Table views can have multiple sections of rows
        // How many sections do we need? Hint: It's not 9999 sections
        return 9999;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // How many rows are we going to be displaying?
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TODO: Get the reusable cell using the reuse identifier
        let cell = UITableViewCell()
        
        //TODO: Get the task that corresponds with the current row we are creating
        
        
        //TODO: Update the cell with the current task's information

        
        return cell
    }
    
    //Mark: UITableViewDelegate methods
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //TODO: Define the delete row action

        
        //TODO: Define the "mark complete" row action

        
        //TODO: Define the "mark incomplete" row action

        
        //TODO: Return the actions that a require for each row
        return []
    }
    
    // UISegmentedControl actions
    
    @IBAction func changeFilter(_ sender: Any) {
        //TODO: Get the currently selected button from the filterButton
        
        
        //TODO: Update the filter in the model
        
        
        //TODO: Tell the table it needs to update
        
        
    }
    
}
