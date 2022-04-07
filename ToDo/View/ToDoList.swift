//
//  ToDoList.swift
//  ToDo
//
//  Created by admin on 22.03.2022.
//

import SwiftUI

struct ToDoList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showUncheckedsOnly = false

    var filteredToDoItems: [ToDoItem] {
        modelData.toDoItems.filter { item in
            (!showUncheckedsOnly || !item.isChecked )
        }
    }
    
    var body: some View {
        List {
            if #available(iOS 15.0, *) {
                Toggle(isOn: $showUncheckedsOnly) {
                    Text("Uncheckeds Only")
                }
                .tint(.orange)
            }
            
            ForEach(filteredToDoItems) { item in
                ToDoRow(toDoItem: item)
                    .frame(height: 45)
            }
        }
        
        Spacer()
    }
}

struct ToDoList_Previews: PreviewProvider {
    static var previews: some View {
        ToDoList()
            .environmentObject(ModelData())
    }
}
