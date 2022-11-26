//
//  SetGoalView.swift
//  Trex
//
//  Created by Kartik Chawla on 2022-11-12.
//

import SwiftUI

struct SetGoalView: View {
    @State var dailyGoal: Int = 5000
    let firestoreController = FireStoreController()
    var body: some View {
        VStack {
            VStack {
                VStack {
                    Text("Your Current Daily Goal is")
                        .padding()
                    TextField("Daily Goal", value: $dailyGoal, format: .number)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        .padding()
                }
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding()
                .background()
                .backgroundStyle(.gray)
            }
            .cornerRadius(20)
            .padding()
            .padding(.bottom, 30)
            Button {
                // Code here
                let data: stepsDataType = .init(date: Date.now.formatted(date: .complete, time: .omitted), steps: 0, goal: dailyGoal)
                firestoreController.saveData(data: data)
            } label: {
                Text("Change Goal")
                    .font(.title)
                    .frame(width: 200, height: 50)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 2))
            }.padding()
            Button {} label: {
                Text("Cancel")
                    .font(.title)
                    .foregroundColor(.red)
                    .frame(width: 200, height: 50)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 2))
            }.padding()
        }
        .padding()
        .navigationTitle("Set Your Goals")
        .onAppear {
            firestoreController.getTodayData { stepsData, _ in
                if let data: [String: Any] = stepsData {
                    self.dailyGoal = data["goal"]! as! Int
                } else {
                    self.dailyGoal = 5000
                }
            }
        }
    }
}
