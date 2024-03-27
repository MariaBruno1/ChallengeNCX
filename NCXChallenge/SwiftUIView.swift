//
//  SwiftUIView.swift
//  NCXChallenge
//
//  Created by Maria Bruno on 25/03/24.
//

import SwiftUI


struct SwiftUIView: View {
    var body: some View {
        TabView {
                Text("Tab Content 1")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(hue: 1.0, saturation: 0.386, brightness: 0.847, opacity: 0.828))
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }.tag(1)
                Text("Tab Content 2").tabItem {
                    Image(systemName: "figure.run")
                    Text("Fitness")
                }.tag(2)
                Text("Tab Content 3").tabItem {
                    Image(systemName: "fork.knife.circle")
                    Text("Diet")
                }
                Text("Tab Content 4").tabItem {
                    Image(systemName: "cooktop")
                    Text("Recipes")
                }
           }
        .accentColor(Color.black)
        }
    }


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
