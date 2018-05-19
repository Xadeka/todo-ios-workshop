//
//  Tasks.swift
//  TodoList
//
//  Created by Zade Kaakarni on 5/19/18.
//  Copyright © 2018 Xadeka. All rights reserved.
//

class Tasks {
    
    //TODO: Define how we are going to store the data
    var allTasks: [Task] = []
    var displatedTasks: [Task] = []
    
    var filter: FilterType = .all
    
    //TODO: Define what kind of filters we will have
    enum FilterType: String {
        case all = "All"
        case todo = "Todo"
        case done = "Done"
    }
    
    func updateFilter(_ newFilter: FilterType) {
        //TODO: Update the current filter and make sure the task list updates too
        filter = newFilter
        if newFilter == .all {
            displatedTasks = allTasks
        } else {
            displatedTasks = allTasks.filter { $0.status.rawValue == newFilter.rawValue }
        }
    }
    
    func addTask(_ newTask: Task) {
        //TODO: Add the new task to the task list
        allTasks.append(newTask)
        if filter != .done {
            displatedTasks.append(newTask)
        }
    }
    
    func removeTask(_ index: Int) {
        //TODO: Remove the task given it's position in the task list
        let taskToRemove = displatedTasks[index]
        for (i, task) in allTasks.enumerated() {
            if task.id == taskToRemove.id {
                allTasks.remove(at: i)
            }
        }
        
        displatedTasks.remove(at: index)
    }
    
    func updateTask(_ index: Int, with newStatus: Task.Status) {
        //TODO: Update the the tasks given it's position and the new task status
        let taskToUpdate = displatedTasks[index]
        for (i, task) in allTasks.enumerated() {
            if task.id == taskToUpdate.id {
                allTasks[i].status = newStatus
            }
        }
        updateFilter(filter)
    }
}
