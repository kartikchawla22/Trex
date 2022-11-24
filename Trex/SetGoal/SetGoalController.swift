//
//  SetGoalController.swift
//  Trex
//
//  Created by Kartik Chawla on 2022-11-21.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
let auth = Auth.auth()
class SetGoalController {
    private var db: Firestore!
    private let collectionName = "StepsData"
    init() {
        let settings = FirestoreSettings()
        
        Firestore.firestore().settings = settings
        // [END setup]
        db = Firestore.firestore()
    }
    func saveData(data: stepsDataType) {
        var ref: DocumentReference? = nil
         db.collection(collectionName).whereField("email", isEqualTo: auth.currentUser?.email! ?? "").whereField("date", isEqualTo: Date.now.formatted(date: .complete, time: .omitted)).getDocuments(completion: { (querySnapshot, err) in
             for document in querySnapshot!.documents {
                 print("\(document.reference)")
             }
             print(ref)
        })
        
//         db.collection(collectionName).addDocument(data: [
//            "date": data.date,
//            "steps": data.steps,
//            "goal": data.goal,
//            "email": auth.currentUser?.email! ?? ""
//        ]) { err in
//            if let err = err {
//                print("Error adding document: \(err)")
//            } else {
//                print("Document added with ID: \(ref!.documentID)")
//            }
//        }
    }
    func getAllData() -> [Any] {
        var data = [Any]()
        db.collection(collectionName).whereField("email", isEqualTo: auth.currentUser?.email! ?? "").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    
                    print("\(document.documentID) => \(document.data())")
                    data.append(document.data())
                }
            }
        }
        return data
    }
    
    func getTodayData(completion: @escaping (_ stepsData: stepsDataType?) -> Void) -> Any {
        print(Date.now.formatted(date: .complete, time: .omitted))
        print(auth.currentUser?.email! ?? "")
        var data = [Any]()
        db.collection(collectionName).whereField("email", isEqualTo: auth.currentUser?.email! ?? "").whereField("date", isEqualTo: Date.now.formatted(date: .complete, time: .omitted)).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print(document.data())
                    data.append(document.data())
                    completion(document.data() as? stepsDataType)
                }
            }
        }
        return data
    }
}
struct stepsDataType {
    var date: String
    var steps: Int
    var goal: Int
    var email: String? = auth.currentUser?.email
}
