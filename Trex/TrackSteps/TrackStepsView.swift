//
//  TrackStepsView.swift
//  Trex
//
//  Created by Kartik Chawla on 2022-11-12.
//

import SwiftUI

struct TrackStepsView: View {
    let firestoreController = FireStoreController()
    @State private var arr: [StepsIdentifiable] = []

    var body: some View {
            VStack {
                List($arr) { element in
                    TrackStepsCell(date: element.date, goal: element.goal, steps: element.steps)
                }
//                Table(arr) {
//                    TableColumn("Steps") { stepData in
//                        HStack {
//                            GeometryReader { geometry in
//                            Text(stepData.date)
//                            Spacer()
//                                Text(stepData.steps)
//                            Spacer()
//                                Text(stepData.goal)
//                            }
//                    }
//                }
//            }.padding()
        }.navigationBarTitle("Tracking")
            .onAppear {
                firestoreController.getAllData { stepsData in
                    if let data: [[String: Any]] = stepsData {
                        for d in data {
                            self.arr.append(StepsIdentifiable(date: d["date"] as! String, steps: "\(d["steps"]!)", goal: "\(d["goal"]!)"))
                        }
//                    self.dailyGoal = data["goal"]! as! Int
                    } else {
//                    self.dailyGoal = 5000
                    }
                }
            }
    }
}

struct TrackStepsView_Previews: PreviewProvider {
    static var previews: some View {
        TrackStepsView()
    }
}
