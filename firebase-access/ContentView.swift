//
//  ContentView.swift
//  firebase-access
//
//  Created by Jackson Wiese on 4/12/23.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @ObservedObject var model = ViewModels()
    @State var id = ""
    @State var category = ""
    @State var time = ""
    
    var body: some View {
        //excellent for settings page
        
        VStack{
            List(model.list) {//list of model classes / ids categories
                item in
                HStack {
                    Text(item.category)
                    Spacer()
                    Button(action: {
                        model.deleteData(lessonToDelete: item)
                    }, label: {
                        Image(systemName: "trash").buttonStyle(BorderedButtonStyle())
                    })
                    
                    
                }
            }
            
            //                .onDelete { indexSet in
            //                    for index in IndexSet {
            //                        self.model.deleteData(lessonToDelete: index)
        }
        Divider()
        
        //for elements the user wants to add
        VStack(spacing: 5) {
            TextField("ID: ", text:$id)
                .keyboardType(.default)
            TextField("category: ", text:$category)
                .keyboardType(.default)
            TextField("time: ", text:$time)
                .keyboardType(.default)

            HStack{
                Button(action: {
                    //call app data
                    model.addData(id: Int(id) ?? 0, category: category, time: time)
                    
                    //clear field
                    id = ""
                    category = ""
                    time = ""
                    
                }) {
                    Text("Upload")
                }
                Spacer()
                Button(action: {
                    print("let's get this running")
                    //model.updateData(lessonToModify: id: id, category: category, time: time)
                }, label: {
                    Text("Modify")
                })
            }
            
            
        }
        .padding()
        
    }//var body ends here
    
    init() {
        model.getData()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

