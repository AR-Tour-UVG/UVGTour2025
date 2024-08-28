//
//  DistanceIndicatorView.swift
//  UVGTour
//
//  Created by Guillermo Santos Barrios on 8/26/24.
//

import SwiftUI

struct DistanceIndicatorView: View {
    @State private var playHaptics = false
    let distance: Int
    let arriveThreshold = 0
    var indicatorText: String {
        if arrived {
            return "Llegaste".hardcoded
        }
        return "\(distance) \(distance > 1 ? "metros" : "metro")".hardcoded
        
    }
    var arrived: Bool { distance <= arriveThreshold }
    var body: some View {
        Text(indicatorText)
            .font(.caption2)
            .padding(.vertical, Sizes.p8)
            .frame(width: 100)
            .background(arrived  ? .uvgGreen : .white)
            .cornerRadius(Sizes.p12)
            .sensoryFeedback(.success, trigger: playHaptics)
            .onAppear(perform: {
                if arrived && !playHaptics {
                    triggerHaptics()
                }
            })
            .onChange(of: arrived) { oldValue, newValue in
                if newValue && !playHaptics {
                    triggerHaptics()
                }
            }
        
    }
    
    private func triggerHaptics() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        playHaptics = true
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack {
            DistanceIndicatorView(distance: 5)
            DistanceIndicatorView(distance: 3)
        }
    }
    
}
