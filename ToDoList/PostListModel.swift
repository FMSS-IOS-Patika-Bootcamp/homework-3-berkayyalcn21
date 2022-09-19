//
//  PostListModel.swift
//  ToDoList
//
//  Created by Berkay on 19.09.2022.
//

import Foundation

protocol PostListModelViewModelProtocol: AnyObject {
    
    func didDataFetch()
}

class PostListModel {
    
    weak var delegate: PostListModelViewModelProtocol?
    
    func fetchData() {
        // TODO:
        delegate?.didDataFetch()
    }
}
