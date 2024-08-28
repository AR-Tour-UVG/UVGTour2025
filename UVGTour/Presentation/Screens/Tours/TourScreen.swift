//
//  TourScreen.swift
//  UVGTour
//
//  Created by Guillermo Santos Barrios on 8/24/24.
//

import SwiftUI

/// Screen for allowing the progression of a ``[[Tour]]``
struct TourScreen: View {
    
    @StateObject var tourViewModel: TourViewModel
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            Text("AR arrow here")
            VStack(spacing: Sizes.p12) {
                Image("uvg")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                Spacer()
                if let distanceToStopSensor = tourViewModel.distanceToStopSensor {
                    DistanceIndicatorView(distance: distanceToStopSensor )
                        .offset(y: Sizes.p24)
                }
                TourProgressView()
                    .padding(.horizontal, Sizes.p24)
                    .padding(.bottom, Sizes.p24)
                    .environmentObject(tourViewModel)
            }
        }
    }
}

#Preview {
    let tour = LocalToursDatasource.tours[0]
    let sensorsRepository = SensorRepositoryImpl(datasource: SocketIOSensorDatasource())
    let tourViewModel = TourViewModel(tour: tour, sensorsRepository: sensorsRepository)
    
    return NavigationView(content: {
        TourScreen(tourViewModel: tourViewModel)
    })
    
}
