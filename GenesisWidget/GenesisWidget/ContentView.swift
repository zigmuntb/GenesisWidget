//
//  ContentView.swift
//  GenesisWidget
//
//  Created by Arsenkin Bogdan on 03.01.2021.
//

import SwiftUI

struct ContentView: View {    
    var entry: Provider.Entry

    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 40) {
                VStack {
                    BackgroundImage(text: "Small widget")
                    
                    SquareWidget(entry: entry, isSmallWidget: true)
                        .frame(width: 159, height: 159)
                        .cornerRadius(26)
                }
                
                VStack {
                    BackgroundImage(text: "Medium widget")
                    
                    LongWidget(entry: entry)
                        .frame(width: 348, height: 159)
                        .cornerRadius(26)
                }
                
                VStack {
                    BackgroundImage(text: "Large widget")
                    
                    SquareWidget(entry: entry, isSmallWidget: false)
                        .frame(width: 348, height: 357)
                        .cornerRadius(26)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(entry: WidgetEntry())
    }
}

struct BackgroundImage: View {
    let text: String
    
    var body: some View {
        Image(K.Images.smallImageDark)
            .resizable()
            .frame(width: 400, height: 80)
            .mask(Text(text)
                    .font(.system(size: 40, weight: .semibold, design: .rounded)))
    }
}
