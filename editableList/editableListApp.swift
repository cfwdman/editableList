//
//  editableListApp.swift
//  editableList
//
//  Created by Christoph Dohrmann on 31.01.22.
//

import SwiftUI

class TodoItem: Identifiable, ObservableObject {
    let id = UUID()
    var title: String = "untitled"
}

@main
struct editableListApp: App {
    @State var items = [TodoItem]()
    var body: some Scene {
        WindowGroup {
            ContentView(items: $items)
            .onAppear {
                var item1 = TodoItem()
                item1.title = "item1"
                var item2 = TodoItem()
                item2.title = "item2"
                self.items.append(item1)
                self.items.append(item2)
            }
        }
    }
}
