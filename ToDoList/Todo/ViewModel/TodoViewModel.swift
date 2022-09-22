//
//  TodoViewModel.swift
//  ToDoList
//
//  Created by Berkay on 22.09.2022.
//

import Foundation


class TodoViewModel {
    
    private let model = TodoModel()
    
    func didViewLoad() -> [Todo] {
        let todos = model.get()
        return todos
    }
}
