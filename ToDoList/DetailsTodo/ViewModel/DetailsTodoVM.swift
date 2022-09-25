//
//  DetailsTodoVM.swift
//  ToDoList
//
//  Created by Berkay on 20.09.2022.
//

import Foundation


class DetailsTodoVM {
    
    private let model = DetailsTodoModel()
    
    // Data transfer to Model
    func sendDataUpdate(todo: Todo) {
        model.update(todo: todo)
    }
}
