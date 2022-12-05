//
//  Pedometer.swift
//  Trex
//
//  Created by Kartik Chawla on 2022-10-27.
//

import CoreMotion
import SwiftUI
import WidgetKit

/// This is the class that handles the CoreMotion's pedometer sensor.
class PedometerController: ObservableObject {
    private let pedometer: CMPedometer = .init()
    @Published public var steps: Int = 0;
    @AppStorage("steps", store: UserDefaults(suiteName: "group.net.kartikchawla.trex"))

    var storedSteps: Int = 0

    // Checking if pedometer is available.
    private let isPedometerAvailable: Bool = CMPedometer.isDistanceAvailable() && CMPedometer.isPedometerEventTrackingAvailable() && CMPedometer.isStepCountingAvailable()

    // This is called when we initialize this class
    init() {
        if isPedometerAvailable {
            let startOfDay = Calendar.current.startOfDay(for: .now)
            pedometer.startUpdates(from: startOfDay, withHandler: { data, error in
                DispatchQueue.main.async {
                    guard let data = data, error == nil else {
                        return
                    }
                    self.steps = data.numberOfSteps.intValue
                    self.storedSteps = data.numberOfSteps.intValue
                    WidgetCenter.shared.reloadAllTimelines()
                }
            })
        }
    }
}
