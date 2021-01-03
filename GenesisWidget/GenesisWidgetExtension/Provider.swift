//
//  Provider.swift
//  GenesisWidgetExtension
//
//  Created by Arsenkin Bogdan on 03.01.2021.
//

import SwiftUI
import WidgetKit

enum DateFormats: String {
    case currentDate = "d MMMM"
    case time = "HH:mm"
    case dayInWeek = "EEEE"
    case hours = "HH"
    case minutes = "mm"
    
    static func formattedString(for type: DateFormats) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = type.rawValue
        return formatter.string(from: Date())
    }
}

struct WidgetEntry: TimelineEntry {
    var date: Date
    var currentDay: String
    var currentDate: String
    var currentTime: String
    var batteryLife: String
    var hours: String
    var minutes: String
    
    init() {
        date = Date()
        currentDay = DateFormats.formattedString(for: .dayInWeek)
        currentDate = DateFormats.formattedString(for: .currentDate)
        currentTime = DateFormats.formattedString(for: .time)
        hours = DateFormats.formattedString(for: .hours)
        minutes = DateFormats.formattedString(for: .minutes)
        
        UIDevice.current.isBatteryMonitoringEnabled = true
        batteryLife = String(Int(UIDevice.current.batteryLevel * 100))
    }
}

struct Provider: IntentTimelineProvider {
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<WidgetEntry>) -> Void) {
        let entryData = WidgetEntry()
        let timeLine = Timeline(entries: [entryData], policy: .never)
        
        completion(timeLine)
    }
    
    typealias Entry = WidgetEntry
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (WidgetEntry) -> Void) {
        let entryData = WidgetEntry()
        
        completion(entryData)
    }
    
    func placeholder(in context: Context) -> WidgetEntry {
        WidgetEntry()
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}
