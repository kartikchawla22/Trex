//
//  SetGoalView.swift
//  Trex
//
//  Created by Kartik Chawla on 2022-11-12.
//

import SwiftUI

struct SetGoalView: View {
    @State var dailyGoal: Int = 5000
    let setGoalController = SetGoalController()
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
                    print(self.dailyGoal)
                    // Code here
                    let data: stepsDataType = stepsDataType(date: Date.now.formatted(date: .complete, time: .omitted), steps: 0, goal: dailyGoal)
                    setGoalController.saveData(data: data)
                } label: {
                    Text("Change Goal")
                        .font(.title)
                        .frame(width: 200, height: 50)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 2))
                }.padding()
                Button {
                    // Code
                } label: {
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
            setGoalController.getTodayData() { (data) in
                self.dailyGoal = data?.goal ?? 5000
                print("check")
                print(self.dailyGoal)
            }
        }
    }
}

//struct SetGoalView_Previews: PreviewProvider {
//    @State private var intialStepsGoals = 5000
//    static var previews: some View {
////        SetGoalView(dailyGoal: $intialStepsGoals)
//    }
//}
