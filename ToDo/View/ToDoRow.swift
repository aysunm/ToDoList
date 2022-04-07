//
//  ToDoRow.swift
//  ToDo
//
//  Created by admin on 22.03.2022.
//

import SwiftUI

struct ToDoRow: View {
    @EnvironmentObject var modelData: ModelData
    var toDoItem: ToDoItem
    
    var landmarkId: Int {
        modelData.toDoItems.firstIndex(where: { $0.id == toDoItem.id })!
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(toDoItem.name)
                    .bold()
                    .foregroundColor(.orange)
//                Text(toDoItem.description ?? "Asd")
//                    .font(.caption)
//                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            if #available(iOS 15.0, *) {
                if let item = $modelData.toDoItems.first(where: { $0.id == toDoItem.id }) {
                    CheckBoxView(isChecked: item.isChecked)
                }
            }
        }
        .padding()
    }
}

struct ToDoRow_Previews: PreviewProvider {
    static var toDoItems = ModelData().toDoItems
    
    static var previews: some View {
        ToDoRow(toDoItem: toDoItems[0])
            .environmentObject(ModelData())
            .previewLayout(.fixed(width: 300, height: 50))
    }
}
