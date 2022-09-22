//
//  AddTodoModel.swift
//  ToDoList
//
//  Created by Berkay on 20.09.2022.
//

import Foundation
import CoreData

class AddTodoModel {
    
    func post(title: String, desc: String, date: String, isCompleted: Bool) {
        
        let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        let data = Todo(context: managedContext)

        data.setValue(UUID(), forKey: "id")
        data.setValue(title, forKey: #keyPath(Todo.todo))
        data.setValue(desc, forKey: #keyPath(Todo.desc))
        data.setValue(date, forKey: #keyPath(Todo.date))
        data.setValue(isCompleted, forKey: #keyPath(Todo.isCompleted))
        data.setValue(Date(), forKey: #keyPath(Todo.sorter))

        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
    }
}
