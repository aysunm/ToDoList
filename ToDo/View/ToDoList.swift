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
    @State private var addNewItem = false
    @State private var newItem: String = ""
    
    var filteredToDoItems: [ToDoItem] {
        modelData.toDoItems.filter { item in
            (!showUncheckedsOnly || !item.isChecked )
        }
    }
    
    var body: some View {
        NavigationView {
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
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
                
                if addNewItem {
                    HStack {
                        FirstResponderTextField(text: $newItem, placeholder: "Add new item")
                        Button(action: {
                            addItem()
                            addNewItem.toggle()
                        }) {
                            Text("Done")
                                .font(.subheadline)
                                .foregroundColor(.orange)
                        }
                    }
                    .frame(height: 20)
                    .padding()
                }
            }
            
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {
                addNewItem.toggle()
            }) {
                Image(systemName: "plus")
            })
            
            .toolbar {
                EditButton()
            }
        }
        
        Spacer()
    }
    
    func deleteItems(at offsets: IndexSet) {
        modelData.toDoItems.remove(atOffsets: offsets)
    }
    
    func moveItems(source: IndexSet, destination: Int) {
        modelData.toDoItems.move(fromOffsets: source, toOffset: destination)
    }
    
    func addItem() {
        modelData.toDoItems.append(ToDoItem(id: UUID(), name: newItem, isChecked: false, category: .toDo))
    }
}

struct ToDoList_Previews: PreviewProvider {
    static var previews: some View {
        ToDoList()
            .environmentObject(ModelData())
    }
}
