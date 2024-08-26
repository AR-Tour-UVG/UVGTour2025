//
//  DistanceIndicatorView.swift
//  UVGTour
//
//  Created by Guillermo Santos Barrios on 8/26/24.
//

import SwiftUI

struct DistanceIndicatorView: View {
    let distance: Int
    var body: some View {
        Text("\(distance) \(distance > 1 ? "metros" : "metro")".hardcoded)
            .font(.caption2)
            .padding(.vertical, Sizes.p8)
            .frame(width: 100)
            .background(.white)
            .cornerRadius(Sizes.p12)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        DistanceIndicatorView(distance: 1)
    }
    
}
