//
//  DistanceIndicatorView.swift
//  UVGTour
//
//  Created by Guillermo Santos Barrios on 8/26/24.
//

import SwiftUI

struct DistanceIndicatorView: View {
    let distance: Int
    let arriveThreshold = 3
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
            .background(arrived  ? .green : .white)
            .cornerRadius(Sizes.p12)
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
