//
//  Entity.swift
//  ToDoList
//
//  Created by Berkay on 20.09.2022.
//

import Foundation


struct PhotoCellViewModel {
    
    var url: String?
}

struct Photos: Decodable {
    
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}
