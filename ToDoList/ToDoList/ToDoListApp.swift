//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Benício Rios on 12/04/2025.
//

import SwiftUI

/*
 MVVM Architecture
 
 Model - Data point
 View - UI
 ViewModel - Manages the model for the view
 
 
 */

@main
struct ToDoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                _ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
        

    }
}
