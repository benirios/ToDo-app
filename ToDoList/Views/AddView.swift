//
//  AddView.swift
//  ToDoList
//
//  Created by Benício Rios on 13/04/2025.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("type something", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button(
                    action: saveButtonPressed, label: {
                        Text("save" .uppercased())})
                .foregroundColor(.white)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .frame( height: 55)
                .background(Color.accentColor)
                .cornerRadius(10 )
            }
            .padding(14)
            
        }
        .navigationTitle("Add a item✏️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    func saveButtonPressed(){
        if textIsAproppriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    func textIsAproppriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your item need to be at least 3 characters long 🚨"
            showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}
    
    #Preview{
        NavigationView{
            AddView()
        }
        .environmentObject(ListViewModel())
    }

