//
//  AddTodoModel.swift
//  ToDoList
//
//  Created by Berkay on 20.09.2022.
//

import Foundation
import CoreData

protocol AddTodoToViewModelProtocol: AnyObject {
    
    func didDataFetchProccesFinish(_ isSuccess: Bool)
}

class AddTodoModel {
    
    weak var delegate: AddTodoToViewModelProtocol?
    var todos: [Todos] = []
    
    func postData(_ title: String, _ desc: String, _ date: String) {
        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context = appDelegate.persistentContainer.viewContext
//        
    }
    
    
    
}
