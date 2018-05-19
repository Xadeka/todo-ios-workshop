//
//  Items.swift
//  TodoList
//
//  Created by Zade Kaakarni on 5/19/18.
//  Copyright © 2018 Xadeka. All rights reserved.
//

import Foundation

class Task {
    //TODO: Define what we need to represent a task
    let id: String = UUID().uuidString
    var name: String = ""
    var status: Status = .todo
    
    //TODO: Define what kind of task statuses we will have
    enum Status: String {
        case todo = "Todo"
        case done = "Done"
    }
}

