//
//  PostListEntity.swift
//  ToDoList
//
//  Created by Berkay on 19.09.2022.
//

import Foundation


struct PostCellViewModel {
    
    var title: String?
    var desc: String?
}

struct Post: Decodable {
    
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
