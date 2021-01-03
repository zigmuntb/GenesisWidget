//
//  MediumWidgetView.swift
//  GenesisWidgetExtension
//
//  Created by Arsenkin Bogdan on 03.01.2021.
//

import SwiftUI
import WidgetKit

struct LongWidget: View {
    @Environment(\.colorScheme) var colorScheme
    var entry: Provider.Entry
    
    var body: some View {
        ZStack {
            Image(colorScheme == .dark ? K.Images.bigImageDark : K.Images.bigImageLight)
                .resizable()
                .blur(radius: colorScheme == .dark ? 0 : 10, opaque: true)
            
            Text(entry.currentTime)
                .font(.system(size: 92, weight: .bold, design: .rounded))
                .opacity(0.6)
                .foregroundColor(.white)
            
            HStack {
                VStack {
                    HStack {
                        Text(entry.currentDate)
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                        Spacer()
                        BatteryView(batteryLevel: entry.batteryLife)
                    }
                    Spacer()
                    HStack {
                        Text(entry.currentDay)
                            .font(K.Fonts.mediumFont)
                            .foregroundColor(.white)
                        Spacer()
                    }
                }.padding()
                Spacer()
            }
        }
    }
}
