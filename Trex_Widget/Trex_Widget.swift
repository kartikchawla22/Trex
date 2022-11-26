//
//  Trex_Widget.swift
//  Trex_Widget
//
//  Created by Kartik Chawla on 2022-10-27.
//

import Intents
import SwiftUI
import WidgetKit

struct StepsDataEntry: TimelineEntry {
    var date: Date = .init()
    var steps: Int
}

struct Provider: IntentTimelineProvider {
    @AppStorage("steps", store: UserDefaults(suiteName: "group.net.kartikchawla.trex"))
    var steps: Int = 0
    func placeholder(in context: Context) -> StepsDataEntry {
        StepsDataEntry(date: Date(), steps: 0)
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (StepsDataEntry) -> ()) {
        let entry = StepsDataEntry(steps: steps)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entry = StepsDataEntry(steps: steps)
        completion(Timeline(entries: [entry], policy: .after(Date())))
    }
}

struct Trex_WidgetEntryView: View {
    var entry: Provider.Entry
    var body: some View {
        VStack {
            Text("Steps: \(entry.steps)")
            Text(entry.date, style: .date).multilineTextAlignment(.center)
        }.padding()
    }
}

@main
struct Trex_Widget: Widget {
    let kind: String = "Trex_Widget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            Trex_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Trex!")
        .description("This is the total number of steps.")
    }
}

struct Trex_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Trex_WidgetEntryView(entry: StepsDataEntry(date: Date(), steps: 0))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
