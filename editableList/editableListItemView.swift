//
//  editableListItemView.swift
//  editableList
//
//  Created by Christoph Dohrmann on 31.01.22.
//

import SwiftUI

struct editableListItemView: View {
    @FocusState private var isFocused : Bool
    @StateObject var item : TodoItem
    @Binding var firstResponderID: UUID?
    @Binding var items: [TodoItem]
    
    var body: some View {
        TextField("Title", text: $item.title)
            .focused($isFocused)
            .task {
                isFocused = (item.id == self.firstResponderID)
            }
            .submitLabel(.go)
            .onSubmit {
                isFocused = true
                let item1 = TodoItem()
                item1.title = "new Item from commit"
                items.append(item1)
                firstResponderID = item1.id
            }
    }
    
    
}

//struct editableListItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        editableListItemView(isFocused: .constant(true), item: <#T##TodoItem#>(), firstResponderID: <#T##Binding<UUID?>#>)
//    }
//}
