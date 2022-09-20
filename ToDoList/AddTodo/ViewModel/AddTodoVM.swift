//
//  AddTodoVM.swift
//  ToDoList
//
//  Created by Berkay on 20.09.2022.
//

import Foundation


class AddTodoVM {
    
    private let model = AddTodoModel()
    
    func sendData(_ title: String, _ desc: String, _ date: String) {
        model.postData(title, desc, date)
    }
}
