//
//  Todo+CoreDataProperties.swift
//  ToDoList
//
//  Created by Berkay on 22.09.2022.
//
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var date: String?
    @NSManaged public var desc: String?
    @NSManaged public var id: UUID?
    @NSManaged public var isCompleted: Bool
    @NSManaged public var todo: String?
    @NSManaged public var sorter: Date?

}

extension Todo : Identifiable {

}
