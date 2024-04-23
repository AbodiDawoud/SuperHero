//
//  SuperHeroView.swift
//  SuperHero
//
//  Created by Mohammad Dawoud on 2024-04-04.
//

import SwiftUI

struct SuperHeroView: View {

    var superH : Superhero
    @State var isAlertPressented : Bool = false
    @State var isScaling : Bool = false
    @State var isSliding : Bool = false
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    var body: some View {
        ZStack {
            Image(superH.image)
                .resizable()
                .scaledToFill()
                .scaleEffect(isScaling ? 1 : 0.7)
                .animation(.easeOut(duration: 0.8), value: isScaling)
            
            VStack(){
                Text(superH.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundStyle(Color.white)
                
                Button {
                    isAlertPressented.toggle()
                    hapticImpact.impactOccurred()
                    PlaySound(sound: "chimeup", type: "mp3")
                } label: {
                    HStack{
                        Text("Start")
                        Image(systemName: "arrow.right.circle")
                    } //: HStack
                    .padding()
                    .font(.title2)
                    .background(LinearGradient(
                        colors: superH.gradientColors,
                        startPoint: .bottomTrailing,
                        endPoint:.topLeading
                    ))
                    .clipShape(Capsule())
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .alert(isPresented: $isAlertPressented) {
                        Alert(
                            title: Text(superH.title),
                            message: Text(superH.message),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                } //: Label
            } //: VStack
            .offset(y: isSliding ? 150 : 300)
            .animation(.easeOut(duration: 3), value: isSliding)
            
            
            
        } //: ZStack
        .frame(width: 335, height: 545, alignment: .center)
        .background(LinearGradient(
            colors: superH.gradientColors,
            startPoint: .topLeading,
            endPoint:.bottomTrailing
        ))
        .cornerRadius(6)
        .shadow(color: .black, radius: 2, x: 2, y: 2)
        .onAppear {
            isScaling = true
            isSliding = true
        }
    }
}

#Preview {
    SuperHeroView(superH : superHerosData[1])
}
