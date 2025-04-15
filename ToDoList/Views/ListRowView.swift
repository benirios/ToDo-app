//
//  ListRowView.swift
//  ToDoList
//
//  Created by Benício Rios on 13/04/2025.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.completed ? "checkmark.circle" : "circle")
                .foregroundColor(item.completed ? .green : .red)
            Text(item.title)
            Spacer()
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "beni1", completed: true)
    static var item2 = ItemModel(title: "beni2", completed: false)
    
    static var previews: some View {
        Group{
             ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(. sizeThatFits)
    }
        
}
