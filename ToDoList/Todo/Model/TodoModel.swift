//
//  TodoModel.swift
//  ToDoList
//
//  Created by Berkay on 22.09.2022.
//

import Foundation
import CoreData


class TodoModel {
    
    // Fetch data func
    func get() -> [Todo] {
        let fetchRequest: NSFetchRequest<Todo> = Todo.fetchRequest()
        
        do {
            let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
            let sorter = NSSortDescriptor(key: #keyPath(Todo.sorter), ascending: false)
            fetchRequest.sortDescriptors = [sorter]
            // Limit ile ekrana gelecek veriyi sınırlandırabiliyoruz
            // fetchRequest.fetchLimit = 2
            let results = try context.fetch(fetchRequest)
            return results
        }catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    // To do delete func
    func delete(indexPath: Int, todos: [Todo]) {
        let todo = todos
        let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        context.delete(todo[indexPath])
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
    }
}
