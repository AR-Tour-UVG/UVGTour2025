//
//  TourStopView.swift
//  UVGTour
//
//  Created by Guillermo Santos Barrios on 8/24/24.
//

import SwiftUI

/// Screen that shows the information of a Tour ``[[Stop]]``
struct TourStopView: View {
    let stop: Stop
    var body: some View {
        VStack {
            Text(stop.name)
                .font(.title2)
                .bold()
            ScrollView {
                Text(stop.description)
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(.red)
                    .frame(height: 250)
                    
            }
            
        }
        .padding(.all, Sizes.p20)
    }
}


#Preview {
    TourStopView(stop: LocalToursDatasource.tours[0].stops[0])
}
