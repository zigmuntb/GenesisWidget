//
//  BatteryView.swift
//  GenesisWidgetExtension
//
//  Created by Arsenkin Bogdan on 03.01.2021.
//

import SwiftUI
import WidgetKit

struct BatteryView: View {
    let batteryLevel: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .foregroundColor(Color.white)
                .frame(width: 37, height: 22, alignment: .center)
                .mask(
                    ZStack {
                        RoundedRectangle(cornerRadius: 6, style: .continuous)
                            .fill(Color(.white))
                            .frame(width: 37, height: 22, alignment: .center)
                        
                        Text(batteryLevel + "%")
                            .font(.system(size: 12, weight: .bold, design: .rounded))
                            .foregroundColor(.black)
                            .layoutPriority(1)
                    }
                    .compositingGroup()
                    .luminanceToAlpha()
                )
            RoundedRectangle(cornerRadius: 2, style: .continuous)
                .foregroundColor(Color.white)
                .frame(width: 5, height: 11, alignment: .center)
                .offset(x: 19)
        }
    }
}

struct BatteryView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryView(batteryLevel: "66")
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
