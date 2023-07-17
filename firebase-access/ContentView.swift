//
//  ContentView.swift
//  firebase-access
//
//  Created by Jackson Wiese on 4/12/23.
//

import SwiftUI
import Firebase
import Foundation

struct ContentView: View {
    
    @ObservedObject var model = ViewModels()
    @State var id = ""
    @State var category = ""
    @State var time = ""
    
    var body: some View {
        //excellent for settings page
        NavigationView {
            
            
            Section {
                VStack{
                    List(model.list) { item in //list of model classes / ids categories
                        Text(item.category)
                            .swipeActions {
                                Button {
                                    //Delete
                                } label: {
                                    Text("Delete")
                                        .background(Color.red)
                                }
                            }
                    }
                    //.onDelete(perform: deleteItem)
                    //  model.deleteData(docid: item.docid)
                }
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
        }
        
    }//var body ends here
    
    init() {
        model.getData()
    }
    
    func deleteItem(at offsets: IndexSet) {
        model.deleteData(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

