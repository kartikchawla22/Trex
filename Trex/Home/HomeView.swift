//
//  HomeView.swift
//  Trex
//
//  Created by Kartik Chawla on 2022-11-11.
//

import SwiftUI

/// this is the main home screen that user will see after login
struct HomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @ObservedObject var pedometerController = PedometerController()
    let firestoreController = FireStoreController()
    @State var dailyGoal: Int = 5000

    var body: some View {
        VStack {
            VStack {
                VStack {
                    Text("Steps You Have Completed")
                        .padding(.bottom, 10)
                        .fixedSize(horizontal: false, vertical: true)
                    Text("\(pedometerController.steps)")
                        .padding(20)
                    Text("Your Daily Goal").padding()
                        .padding(.bottom, 10)
                    Text(dailyGoal, format: .number)
                }
                .font(.title)
                .multilineTextAlignment(.center)
                .fontWeight(.semibold)
                .padding()
                .background()
                .backgroundStyle(.gray)
            }
            .cornerRadius(20)
            .padding()
            NavigationLink {
                SetGoalView()
            } label: {
                Text("Set Goal")
                    .font(.title)
                    .frame(width: 200, height: 50)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 2))
                    .padding()
            }
            NavigationLink {
                TrackStepsView()
            } label: {
                Text("Past Steps")
                    .font(.title)
                    .frame(width: 200, height: 50)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 2))
                    .padding()
            }

            Button(action: {
                viewModel.signOut()
            }, label: {
                Text("Sign Out")
                    .font(.title)
                    .frame(width: 200, height: 50)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 2))
                    .padding()
            })
        }
        .padding()
        .navigationTitle("Home Page")
        .onAppear {
            firestoreController.getTodayData { stepsData, _ in
                if let data: [String: Any] = stepsData {
                    self.dailyGoal = data["goal"]! as! Int
                } else {
                    self.dailyGoal = 5000
                }
                let data: stepsDataType = .init(date: Date.now.formatted(date: .complete, time: .omitted), steps: self.pedometerController.steps, goal: self.dailyGoal)
                firestoreController.saveData(data: data)
            }
        }
    }

    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
