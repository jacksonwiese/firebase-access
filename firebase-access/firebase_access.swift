//
//  firebase_accessApp.swift
//  firebase-access
//
//  Created by Jackson Wiese on 4/12/23.
//

import SwiftUI
import Firebase

@main
struct firebase_access: App {
    //init
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
