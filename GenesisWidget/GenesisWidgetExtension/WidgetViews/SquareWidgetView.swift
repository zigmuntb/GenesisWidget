//
//  SquareWidgetView.swift
//  GenesisWidgetExtension
//
//  Created by Arsenkin Bogdan on 03.01.2021.
//

import SwiftUI

struct SquareWidget: View {
    @Environment(\.colorScheme) var colorScheme
    
    var entry: Provider.Entry
    let isSmallWidget: Bool
    
    var body: some View {
        ZStack {
            Image(colorScheme == .dark ? K.Images.smallImageDark : K.Images.smallImageLight)
                .resizable()
                .blur(radius: colorScheme == .dark ? 0 : 10, opaque: true)
            
            HStack {
                Spacer()
                
                VStack {
                    Text(entry.hours)
                        .font(.system(size: isSmallWidget ? 72 : 159.74, weight: .bold, design: .rounded))
                        .opacity(0.6)
                        .foregroundColor(.white)
                        .offset(y: 10)
                    
                    Text(entry.minutes)
                        .font(.system(size: isSmallWidget ? 72 : 159.74, weight: .bold, design: .rounded))
                        .opacity(0.6)
                        .foregroundColor(.white)
                        .offset(y: -10)
                }.padding(.trailing, 12)
            }
            
            HStack {
                VStack {
                    HStack {
                        Text(entry.currentDate)
                            .font(.system(size: isSmallWidget ? 16 : 24, weight: isSmallWidget ? .semibold : .bold, design: .rounded))
                            .foregroundColor(.white)
                        Spacer()
                        
                        if !isSmallWidget {
                            BatteryView(batteryLevel: entry.batteryLife)
                                .offset(x: -16)
                        }
                    }
                    
                    Spacer()
                    
                    if isSmallWidget {
                        HStack {
                            BatteryView(batteryLevel: entry.batteryLife)
                            Spacer()
                        }.offset(x: 4, y: 6)
                    }
                    HStack {
                        Text(entry.currentDay)
                            .font(isSmallWidget ? K.Fonts.smallFont : K.Fonts.largeFont)
                            .tracking(-0.4)
                            .foregroundColor(.white)
                        Spacer()
                    }
                }
                Spacer()
            }.padding(.leading, isSmallWidget ? 14 : 24)
            .padding(.bottom, isSmallWidget ? 20 : 24)
            .padding(.top, 26)
            
        }
    }
}
