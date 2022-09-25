//
//  TodoViewModel.swift
//  ToDoList
//
//  Created by Berkay on 22.09.2022.
//

import Foundation


class TodoViewModel {
    
    private let model = TodoModel()
    
    // Fetch data
    func didViewLoad() -> [Todo] {
        let todos = model.get()
        return todos
    }
    
    // Transfer data to model
    func sendDataDelete(indexPath: Int, todos: [Todo]) {
        model.delete(indexPath: indexPath, todos: todos)
    }
}
