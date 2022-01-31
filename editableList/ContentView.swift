//
//  ContentView.swift
//  editableList
//
//  Created by Christoph Dohrmann on 31.01.22.
//

import SwiftUI


struct ContentView: View {
    @Binding var items: [TodoItem]
    @State var firstResponderUUID: UUID? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach($items) { $item in
                        editableListItemView(item: item, firstResponderID: $firstResponderUUID, items: $items)
                    }
                }
                Button("add without bounce") {
                    let newItem = TodoItem()
                    items.append(newItem)
                    firstResponderUUID = newItem.id
                }
            }
            .navigationTitle("Todo list")
        }
    }
}

