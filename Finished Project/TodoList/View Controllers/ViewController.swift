//
//  ViewController.swift
//  TodoList
//
//  Created by Zade Kaakarni on 5/18/18.
//  Copyright © 2018 Xadeka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    //TODO: Connect the Outlets from the storyboard here
    @IBOutlet weak var addTaskTextField: UITextField!
    @IBOutlet weak var taskTable: UITableView!
    @IBOutlet weak var filterButtons: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: Tell the table that you are going to handle it's data source and delegate methods
        taskTable.dataSource = self
        taskTable.delegate = self
        
        //TODO: Tell the text field that you are going to handle it's delegate methods
        addTaskTextField.delegate = self
        
    }
    
    //Mark: UITextFieldDelegate methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //TODO: Make a new task from the text field text
        let newTaskName = addTaskTextField.text
        let newTask = Task()
        newTask.name = newTaskName!
        
        //TODO: Add the new task to the data source
        model.addTask(newTask)
        
        //TODO: Tell table that it needs to add a new row
        if model.filter != .done {
            taskTable.insertRows(at: [IndexPath(row: model.displatedTasks.count - 1, section: 0)], with: UITableViewRowAnimation.fade)
        }
        
        //TODO: dismiss the keyboard
        addTaskTextField.resignFirstResponder()
        
        //TODO: Clear the textfield for next task
        addTaskTextField.text = ""
        
        return true
    }
    
    //Mark: UITableViewDataSource
    
    //TODO: Create the model
    var model = Tasks()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // Table views can have multiple sections of rows
        // How many sections do we need? Hint: It's not 9999 sections
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // How many rows are we going to be displaying?
        return model.displatedTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TODO: Get the reusable cell using the reuse identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! TaskCell
        
        //TODO: Get the task that corresponds with the current row we are creating
        let currentTask = model.displatedTasks[indexPath.row]
        
        //TODO: Update the cell with the current task's information
        cell.taskName.text = currentTask.name
        cell.taskType.text = currentTask.status.rawValue
        
        return cell
    }
    
    //Mark: UITableViewDelegate methods
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //TODO: Define the delete row action
        let delete = UITableViewRowAction(style: .default, title: "Delete") { action, index in
            // delete from data
            self.model.removeTask(index.row)
            // tell tableView to remove row
            tableView.deleteRows(at: [index], with: .fade)
        }
        delete.backgroundColor = .red
        
        //TODO: Define the "mark complete" row action
        let markComplete = UITableViewRowAction(style: .default, title: "Mark Complete") { action, index in
            // Update the task
            self.model.updateTask(index.row, with: .done)
            // Tell table view data updated
            if (self.model.filter != .all) {
                tableView.deleteRows(at: [index], with: .fade)
            } else {
                tableView.reloadRows(at: [index], with: .fade)
            }
        }
        markComplete.backgroundColor = .blue
        
        //TODO: Define the "mark incomplete" row action
        let markIncomplete = UITableViewRowAction(style: .default, title: "Mark Incomplete") { action, index in
            // Update the task
            self.model.updateTask(index.row, with: .todo)
            // Tell table view data updated
            if (self.model.filter != .all) {
                tableView.deleteRows(at: [index], with: .fade)
            } else {
                tableView.reloadRows(at: [index], with: .fade)
            }
        }
        markIncomplete.backgroundColor = UIColor.darkGray
        
        //TODO: Return the actions that a require for each row
        if (model.displatedTasks[indexPath.row].status == .done) {
            return [markIncomplete, delete]
        }
        return [markComplete, delete]
    }
    
    // UISegmentedControl actions
    
    @IBAction func changeFilter(_ sender: Any) {
        //TODO: Get the currently selected button from the filterButton
        let selectedButton = filterButtons.selectedSegmentIndex
        //TODO: Update the filter in the model
        switch selectedButton {
        case 1: // Incomplete
            model.updateFilter(.todo)
        case 2: // Complete
            model.updateFilter(.done)
        default: // All (because there isnt another option)
            model.updateFilter(.all)
        }
        //TODO: Tell the table it needs to update
        taskTable.reloadData()
    }
    
}
