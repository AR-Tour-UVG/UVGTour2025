//
//  TourScreen.swift
//  UVGTour
//
//  Created by Guillermo Santos Barrios on 8/24/24.
//

import SwiftUI
import Combine
import CoreLocation

/// Screen for allowing the progression of a ``[[Tour]]``
struct TourScreen: View {
    @StateObject var tourViewModel: TourViewModel
    @ObservedObject var locationManager = LocationManager()
    @State var angle: Float = 0
    @State var showArrow = false
    
    var cancellables = Set<AnyCancellable>()
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            ARTourView(angle: $angle, showArrow: $showArrow)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .ignoresSafeArea()
            
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
        .sensoryFeedback(.success, trigger: tourViewModel.tour.nextStop)
        .onChange(of: tourViewModel.tour, { _, tour in
            let nextAngle = tour.currentStop?.nextStopDirection
            guard let nextAngle  else {
                showArrow = false
                return
            }
            let currentAngleDegrees = Float(locationManager.degrees)
            angle = (currentAngleDegrees * .pi / 180) + nextAngle
            showArrow = !tour.completed && !tourViewModel.isInStopSensor
        })
        .onChange(of: locationManager.degrees) { oldValue, newValue in
            let nextAngle = tourViewModel.tour.currentStop?.nextStopDirection
            if let nextAngle {
                let currentAngleDegrees = Float(locationManager.degrees)
                angle = (currentAngleDegrees * .pi / 180) + nextAngle
                
            }
        }
        .onChange(of: tourViewModel.isInStopSensor) { _, isInStopSensor in
            showArrow = !tourViewModel.tour.completed && !isInStopSensor
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
