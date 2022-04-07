//
//  ToDoItem.swift
//  ToDo
//
//  Created by admin on 22.03.2022.
//

import Foundation
import SwiftUI

struct ToDoItem: Identifiable {
    var id = UUID()
    var name: String
    var description: String?
    var image: Image?
    var isChecked: Bool
    var category: Category = .toDo
    
    enum Category: String, CaseIterable {
        case toDo = "To Do List"
        case shopping = "Shopping List"
    }
}
