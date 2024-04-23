//
//  ContentView.swift
//  SuperHero
//
//  Created by Mohammad Dawoud on 2024-04-03.
//

import SwiftUI

struct ContentView: View {
    var superheros : [Superhero] = superHerosData
    
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(superheros) { item in
                    SuperHeroView(superH: item)
                }
            } //: HStack
            .padding(20)
        } //: ScrollView
    } //: RootView
}

#Preview {
    ContentView()
}
