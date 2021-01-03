//
//  SquareWidgetView.swift
//  GenesisWidgetExtension
//
//  Created by Arsenkin Bogdan on 03.01.2021.
//

import SwiftUI
import WidgetKit

struct SquareWidget: View {
    @Environment(\.colorScheme) var colorScheme
    
    var entry: Provider.Entry
    let widgetType: WidgetFamily
    
    var body: some View {
        ZStack {
            Image(colorScheme == .dark ? K.Images.smallImageDark : K.Images.smallImageLight)
                .resizable()
                .blur(radius: colorScheme == .dark ? 0 : 10, opaque: true)
            
            HStack {
                Spacer()
                
                VStack {
                    Text(entry.hours)
                        .font(.system(size: widgetType == .systemSmall ? 72 : 159.74, weight: .bold, design: .rounded))
                        .opacity(0.6)
                        .foregroundColor(.white)
                        .offset(y: 10)
                    
                    Text(entry.minutes)
                        .font(.system(size: widgetType == .systemSmall ? 72 : 159.74, weight: .bold, design: .rounded))
                        .opacity(0.6)
                        .foregroundColor(.white)
                        .offset(y: -10)
                }.padding(.trailing, 12)
            }
            
            HStack {
                VStack {
                    HStack {
                        Text(entry.currentDate)
                            .font(.system(size: widgetType == .systemSmall ? 16 : 24, weight: widgetType == .systemSmall ? .semibold : .bold, design: .rounded))
                            .foregroundColor(.white)
                        Spacer()
                        
                        if widgetType != .systemSmall {
                            BatteryView(batteryLevel: entry.batteryLife)
                                .offset(x: -16)
                        }
                    }
                    
                    Spacer()
                    
                    if widgetType == .systemSmall {
                        HStack {
                            BatteryView(batteryLevel: entry.batteryLife)
                            Spacer()
                        }.offset(x: 4, y: 6)
                    }
                    HStack {
                        Text(entry.currentDay)
                            .font(widgetType == .systemSmall ? K.Fonts.smallFont : K.Fonts.largeFont)
                            .tracking(-0.4)
                            .foregroundColor(.white)
                        Spacer()
                    }
                }
                Spacer()
            }.padding(.leading, widgetType == .systemSmall ? 14 : 24)
            .padding(.bottom, widgetType == .systemSmall ? 20 : 24)
            .padding(.top, 26)
            
        }
    }
}
