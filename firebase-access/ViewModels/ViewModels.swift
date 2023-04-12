//
//  ViewModels.swift
//  firebase-access
//
//  Created by Jackson Wiese on 4/12/23.
//

import Foundation
import Firebase

//mid list
class ViewModels: ObservableObject { //observable object makes the instance viewable
    @Published var list = [Lesson]()
    
    //write function to fetch data from DB
    func getData() {
        //create database
        //creates instance of database called firestore (still doesn't have the name)
        let db = Firestore.firestore()
        
        //reference DB through specific path
        //finds collections named lesson
        db.collection("lesson").getDocuments{
            snapshot, error in
            
            //check for the errors
            if error == nil {
                if let snapshot = snapshot {
                    // get all the data from the documents in the database

                    //mapping the documents is basically a for loop going through each of the elements
                    //Database typically run on the back thread, this dispatch moves it to the main thread
                    DispatchQueue.main.async {
                        self.list = snapshot.documents.map { docs in
                            return Lesson(docid: docs.documentID, id: docs["id"] as? Int ?? 0, category: docs["category"] as? String ?? "", time: docs["time"] as? String ?? "")
                    }
                    
                        
                        //id: docs["id"] as? Int ?? "" -> after ?? is asking if it's not a string
                        
                    } //end of map
                }
            } else {
               //error WARNING MESSAGE
                
                
            }
            
            //fails
            
            
        }
        
        
        //read document
        
        
    }
    //import that data into UI
    
    
}
