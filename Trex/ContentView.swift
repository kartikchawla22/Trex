//
//  ContentView.swift
//  Trex
//
//  Created by Kartik Chawla on 2022-10-27.
//

import SwiftUI
import CoreMotion

struct ContentView: View {
    @ObservedObject var pedometerController = PedometerController()
    var body: some View {
        VStack {
            Text("Hello, world! \(pedometerController.steps)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
