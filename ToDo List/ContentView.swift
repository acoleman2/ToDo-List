//
//  ContentView.swift
//  ToDo List
//
//  Created by Ariya Coleman on 1/25/24.
//

import SwiftUI

struct ContentView: View {
    @State private var toDoItems =
            [ToDoItem(priority: "High", description: "Take out trash", dueDate: Date()),
             ToDoItem(priority: "Medium", description: "Pick up clothes", dueDate: Date()),
             ToDoItem(priority: "Low", description: "Eat a donut", dueDate: Date())]
    var body: some View {
        NavigationView {
            List {
                ForEach(ToDoItem) { item in
                    Text(item.description)
                }
                .onMove { indices, newoffset in
                    ToDoItem.move(fromOffsets: indices, toOffset: newoffset)
                }
                .onDelete { indexSet in
                    ToDoItem.remove(atOffsets: indexSet)
                    
                }
            }
            .navigationBarTitle("To Do List", displayMode: .inline)
            .navigationBarItems(leading: EditButton())
        }
        
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
    }
    
    struct ToDoItem: Identifiable {
        var id = UUID()
        var priority = String()
        var description = String()
        var dueDate = Date()
    }
}
