//
//  TrackStepsView.swift
//  Trex
//
//  Created by Kartik Chawla on 2022-11-12.
//

import SwiftUI

struct TrackStepsView: View {
    private var arr = [
        StepsIdentifiable(date: .now, steps: "5000", goal: "5000"),
        StepsIdentifiable(date: .now, steps: "5000", goal: "5000"),
        StepsIdentifiable(date: .now, steps: "5000", goal: "5000"),
        StepsIdentifiable(date: .now, steps: "5000", goal: "5000"),
        StepsIdentifiable(date: .now, steps: "5000", goal: "5000"),
        StepsIdentifiable(date: .now, steps: "5000", goal: "5000"),
        StepsIdentifiable(date: .now, steps: "5000", goal: "5000"),
        StepsIdentifiable(date: .now, steps: "5000", goal: "5000"),
        StepsIdentifiable(date: .now, steps: "5000", goal: "5000"),
        StepsIdentifiable(date: .now, steps: "5000", goal: "5000"),
        StepsIdentifiable(date: .now, steps: "5000", goal: "5000"),
        StepsIdentifiable(date: .now, steps: "5000", goal: "5000"),
        StepsIdentifiable(date: .now, steps: "5000", goal: "5000"),
        StepsIdentifiable(date: .now, steps: "5000", goal: "5000")
    ]

    var body: some View {
        VStack {
            WelcomeTextView()
            
            List(arr) {
                _ in TrackStepsCell()
            }
        }
    }
}

struct TrackStepsView_Previews: PreviewProvider {
    static var previews: some View {
        TrackStepsView()
    }
}
