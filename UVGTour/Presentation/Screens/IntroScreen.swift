//
//  IntroScreen.swift
//  UVGTour
//
//  Created by LEIVA PEREZ, DIEGO ALBERTO on 28/05/25.
//

import SwiftUI

struct IntroScreen: View {
    let onFinish: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            Image("jack_saludo")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 300)
                .padding(.top, 40)

            Text("Bienvenido a UVG Tour")
                .font(.title)
                .bold()
                .padding()

            Button("Empezar") {
                onFinish()
            }
            .buttonStyle(.borderedProminent)
            .padding(.top, 40)
            
            Spacer()
        }
        .padding()
        .onAppear {
            TourAudioPlayer.play(audioNamed: "welcome_audio")
        }
    }
}

