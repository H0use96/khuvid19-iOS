//
//  KHUVID_19_Widget.swift
//  KHUVID-19-Widget
//
//  Created by KHU_TAEWOO on 2022/06/05.
//

import WidgetKit
import SwiftUI
import Intents
//import KHUVID_19_iOS

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(),configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        
        Task {
            let result = await Repository.shared.getCurrentSituation()
            let curCount = result[0].todayCnt
            let diff = result[0].todayCnt - result[1].todayCnt
            let timeline = Timeline(entries: [SimpleEntry(date: Date(),todayCount: curCount, diffCount: diff, configuration: configuration)], policy: .atEnd)
            completion(timeline)
        }
    }
}

struct SimpleEntry: TimelineEntry {
    var date: Date
    var todayCount: Int?
    var diffCount: Int?
    let configuration: ConfigurationIntent
}

struct KHUVID_19_WidgetEntryView : View {
    var entry: Provider.Entry
    var body: some View {
        VStack(alignment: .center) {
            Text("오늘의 확진자 수")
                .font(.title2)
                .fontWeight(.semibold)
            Text("\(entry.todayCount ?? 0) 명")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
            if let diffCount = entry.diffCount {
                Text("어제보다 \(abs(diffCount))명 \(diffCount > 0 ? "증가" : "감소" )")
            }
        }
    }
}

@main
struct KHUVID_19_Widget: Widget {
    let kind: String = "KHUVID_19_Widget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            KHUVID_19_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct KHUVID_19_Widget_Previews: PreviewProvider {
    static var previews: some View {
        KHUVID_19_WidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
