//
//  GenesisWidgetExtension.swift
//  GenesisWidgetExtension
//
//  Created by Arsenkin Bogdan on 03.01.2021.
//
import WidgetKit
import SwiftUI

struct GenesisWidgetExtensionEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var size
    
    var body: some View {
        switch size {
        case .systemSmall, .systemLarge:
            SquareWidget(entry: entry, widgetType: size)
        case .systemMedium:
            LongWidget(entry: entry)
        @unknown default:
            Text("Unknown")
        }
    }
}

@main
struct GenesisWidgetExtension: Widget {
    let kind: String = "GenesisWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            GenesisWidgetExtensionEntryView(entry: entry)
        }
        .configurationDisplayName("GenesisWidget")
        .description("This is an example widget for Genesis.")
    }
}

struct WidgetView: View {
    @Environment(\.widgetFamily) var size
    var entry: Provider.Entry
    
    var body: some View {
        switch size {
        case .systemSmall, .systemLarge:
            SquareWidget(entry: entry, widgetType: size)
        case .systemMedium:
            LongWidget(entry: entry)
        @unknown default:
            Text("Unknown")
        }
    }
}

struct SmallWidget_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView(entry: WidgetEntry())
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
