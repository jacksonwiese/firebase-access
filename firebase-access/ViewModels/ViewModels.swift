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
    
    //delete data
    func deleteData(lessonToDelete: Lesson, listNumber: String) {
        //get a reference to the database
        let db = Firestore.firestore()

        let numberToRemove = IndexSet([listNumber])
        //specify what we want to delete
        db.collection("lesson").document().delete { error in
            if error == nil {
                self.list.remove(atOffsets: numberToRemove) {lesson in
                    return lesson.docid == lessonToDelete.docid
                }
            } else {
                //record the error if you wish
            }
        }
    }
    
//    func deleteData(docId: String) {
//        //get a reference to the database
//        let db = Firestore.firestore()
//
//        //specify what we want to delete
//        db.collection("lesson").document(docId).delete { error in
//            if error == nil {
//                self.list.remove(at: Lesson)
//            } else {
//                //record the error if you wish
//            }
//        }
//    }
    
    
    //this is the function for adding data
    func addData(id: Int, category: String, time: String) {
        //get a reference to the database
        let db = Firestore.firestore()
        
        //add document to collection
        db.collection("lesson").addDocument(data: ["id": id, "category": category, "time": time]) { error in
            if error == nil {
                self.getData()
            } else {
                //throws an error here and record it
                //Print(Text("error in adding data"))
            }
        }
    }
    
    
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
