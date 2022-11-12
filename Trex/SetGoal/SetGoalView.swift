//
//  SetGoalView.swift
//  Trex
//
//  Created by Kartik Chawla on 2022-11-12.
//

import SwiftUI

struct SetGoalView: View {
    @State var dailyGoal = 5000
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
    }
}

struct SetGoalView_Previews: PreviewProvider {
    static var previews: some View {
        SetGoalView()
    }
}
