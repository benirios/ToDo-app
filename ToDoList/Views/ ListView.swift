//
//   ListView.swift
//  ToDoList
//
//  Created by Benício Rios on 12/04/2025.
//

import SwiftUI

struct _ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }
            else{
                List{
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
            .navigationTitle("ToDo List📝")
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                    NavigationLink("add", destination: AddView())
            )
    }
}

#Preview {

    NavigationView{
        _ListView()
    }
    .environmentObject(ListViewModel())
}


