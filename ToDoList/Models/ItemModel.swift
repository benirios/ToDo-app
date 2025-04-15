//
//  ItemModel.swift
//  ToDoList
//
//  Created by Benício Rios on 14/04/2025.
//

import Foundation


//immutable struct
struct ItemModel: Identifiable, Codable {
    var id: String = UUID().uuidString //random id for the item
    let title: String //item title (name)
    let completed: Bool //item state (completed(true)/uncompleteted(false))
    
    
    init (id:String = UUID().uuidString, title: String, completed: Bool) {
    self.id = id
    self.title = title
    self.completed = completed
    }
    func updateCompletition() -> ItemModel {
        return ItemModel(id: id, title: title, completed: !completed)
    }
}
