//
//  ModelData.swift
//  ToDo
//
//  Created by admin on 22.03.2022.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var toDoItems: [ToDoItem] = [
        ToDoItem(name: "Alışveriş yap", isChecked: true),
        ToDoItem(name: "Kitap oku", isChecked: false),
        ToDoItem(name: "Çöpü at", isChecked: true)
    ]
    
    var doneItems: [ToDoItem] {
        toDoItems.filter { $0.isChecked }
    }
    
    var categories: [String: [ToDoItem]] {
        Dictionary(grouping: toDoItems, by: { $0.category.rawValue })
    }
}
