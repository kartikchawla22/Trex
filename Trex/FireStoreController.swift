//
//  FireStoreController.swift
//  Trex
//
//  Created by Kartik Chawla on 2022-11-24.
//

import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import Foundation
import SwiftUI

let auth = Auth.auth()
class FireStoreController {
    private var db: Firestore!
    private let collectionName = "StepsData"
    @ObservedObject var pedometerController = PedometerController()
    init() {
        let settings = FirestoreSettings()

        Firestore.firestore().settings = settings
        // [END setup]
        db = Firestore.firestore()
    }

    func saveData(data: stepsDataType) {
        var referrence: DocumentReference?
        getTodayData { stepsData, ref in
            if stepsData == nil || stepsData!.count == 0 {
                referrence = self.db.collection(self.collectionName).addDocument(data: [
                    "date": data.date,
                    "steps": self.pedometerController.steps,
                    "goal": data.goal,
                    "email": auth.currentUser?.email! ?? ""
                ]) { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("Document added with ID: \(referrence!.documentID)")
                    }
                }
                return
            }
            self.db.collection(self.collectionName).document(ref!).updateData([
                "date": data.date,
                "steps": self.pedometerController.steps,
                "goal": data.goal,
                "email": auth.currentUser?.email! ?? ""
            ]);
        }
    }

    func getAllData(completion: @escaping (_ stepsData: [[String: Any]]?) -> Void) {
        var data = [[String: Any]]()
        db.collection(collectionName).whereField("email", isEqualTo: auth.currentUser?.email! ?? "").getDocuments { querySnapshot, err in
            if let err = err {
                print("Error getting documents: \(err)")
                completion(nil)
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    data.append(document.data())
                }
                completion(data)
            }
        }
    }

    func getTodayData(completion: @escaping (_ stepsData: [String: Any]?, _ ref: String?) -> Void) {
        var data: [String: Any]?
        var ref: String? = ""
        db.collection(collectionName).whereField("email", isEqualTo: auth.currentUser?.email! ?? "").whereField("date", isEqualTo: Date.now.formatted(date: .complete, time: .omitted)).getDocuments { querySnapshot, err in
            if let err = err {
                print("Error getting documents: \(err)")
                completion(nil, "")
            } else {
                for document in querySnapshot!.documents {
                    ref = "\(document.reference.documentID)"
                    data = document.data()
                }
                completion(data, ref)
            }
        }
    }
}

struct stepsDataType {
    var date: String
    var steps: Int
    var goal: Int
    var email: String? = auth.currentUser?.email
}
