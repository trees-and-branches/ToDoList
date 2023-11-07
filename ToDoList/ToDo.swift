//
//  ToDo.swift
//  ToDoList
//
//  Created by shark boy on 11/3/23.
//

import UIKit

struct ToDo: Equatable, Codable {
    
    let id: UUID
    
    var title: String
    
    var isComplete: Bool
    
    var dueDate: Date
    
    var notes: String?
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let archiveURL = documentsDirectory.appendingPathComponent("toDos").appendingPathExtension("plist")
    
    init(title: String, isComplete: Bool, dueDate: Date, notes: String? = nil) {
        self.id = UUID()
        self.title = title
        self.isComplete = isComplete
        self.dueDate = dueDate
        self.notes = notes
    }
    
    static func loadToDos() -> [ToDo]? {
        guard let codedToDos = try? Data(contentsOf: archiveURL) else { return nil }
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<ToDo>.self, from: codedToDos)
    }
    
    static func saveToDos(_ toDos: [ToDo]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedToDos = try? propertyListEncoder.encode(toDos)
        try? codedToDos?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func == (lhs: ToDo, rhs: ToDo) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    static func loadSampleToDos() -> [ToDo] {
        let toDo1 = ToDo(title: "ToDo1", isComplete: false, dueDate: Date(), notes: "note 1")
        let toDo2 = ToDo(title: "ToDo2", isComplete: false, dueDate: Date(), notes: "note 2")
        let toDo3 = ToDo(title: "ToDo3", isComplete: false, dueDate: Date(), notes: "note 3")
        let toDo4 = ToDo(title: "ToDo4", isComplete: false, dueDate: Date(), notes: "note 4")
        
        return [toDo1, toDo2, toDo3, toDo4]
    }

    
}
