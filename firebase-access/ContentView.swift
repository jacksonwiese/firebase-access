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
    
        
    var body: some View {
        //excellent for settings page
    
        List(model.list) {//list of model classes / ids categories
            item in
            
            Text(item.category)
        }
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
