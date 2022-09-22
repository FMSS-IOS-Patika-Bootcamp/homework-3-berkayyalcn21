//
//  DetailsTodoModel.swift
//  ToDoList
//
//  Created by Berkay on 20.09.2022.
//

import Foundation


class DetailsTodoModel {
    func update(todo: Todo) {
        if todo.isCompleted == true {
            todo.isCompleted = false
            AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
        }else {
            todo.isCompleted = true
            AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
        }
    }
}
