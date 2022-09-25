//
//  AddTodoVM.swift
//  ToDoList
//
//  Created by Berkay on 20.09.2022.
//

import Foundation
import CoreData


class AddTodoVM {
    
    let model = AddTodoModel()
    
    // Transfer to Model
    func sendDataPost(_ title: String, _ desc: String, _ date: String, _ isCompleted: Bool) {
        model.post(title: title, desc: desc, date: date, isCompleted: isCompleted)
    }
}
