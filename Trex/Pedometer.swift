//
//  Pedometer.swift
//  Trex
//
//  Created by Kartik Chawla on 2022-10-27.
//

import CoreMotion
import SwiftUI
import WidgetKit



class PedometerController: ObservableObject {
    
    private let pedometer: CMPedometer = CMPedometer()
    
    @Published public var steps: Int = 0;
    
    @AppStorage("steps", store: UserDefaults(suiteName: "group.net.kartikchawla.trex"))
    var storedSteps: Int = 0
    
    private let isPedometerAvailable: Bool = CMPedometer.isDistanceAvailable() && CMPedometer.isPedometerEventTrackingAvailable() && CMPedometer.isStepCountingAvailable()
    
    init() {
        if isPedometerAvailable {
            let startOfDay = Calendar.current.startOfDay(for: .now)
            pedometer.startUpdates(from: startOfDay, withHandler: { (data, error) in
                DispatchQueue.main.async {
                    guard let data = data, error == nil else { return }
                    self.steps = data.numberOfSteps.intValue
                    self.storedSteps = data.numberOfSteps.intValue
                    WidgetCenter.shared.reloadAllTimelines()
                }
            })
        }
    }
}
