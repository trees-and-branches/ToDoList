//
//  ToDo.swift
//  ToDoList
//
//  Created by shark boy on 11/3/23.
//

import UIKit

struct ToDo: Equatable {
    
    let id = UUID()
    
    var title: String
    
    var isComplete: Bool
    
    var dueDate: Date
    
    var notes: String?
    static func ==(lhs: ToDo, rhs: ToDo) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    static func loadToDos() -> [ToDo]?  {
        return nil
    }
    
    static func loadSampleToDos() -> [ToDo] {
        let toDo1 = ToDo(title: "ToDo1", isComplete: false, dueDate: Date(), notes: "note 1")
        let toDo2 = ToDo(title: "ToDo2", isComplete: false, dueDate: Date(), notes: "note 2")
        let toDo3 = ToDo(title: "ToDo3", isComplete: false, dueDate: Date(), notes: "note 3")
        let toDo4 = ToDo(title: "ToDo4", isComplete: false, dueDate: Date(), notes: "note 4")
        
        return [toDo1, toDo2, toDo3, toDo4]
    }

    
}
