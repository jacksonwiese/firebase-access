//
//  Lesson.swift
//  firebase-access
//
//  Created by Jackson Wiese on 4/12/23.
//

import Foundation

//iudentifiable will be recongzied both otehr classes
struct Lesson: Identifiable {
    var docid: String
    var id: Int
    var category: String
    var time: String
}
