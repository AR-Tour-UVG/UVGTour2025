//
//  TourProgressView.swift
//  UVGTour
//
//  Created by Guillermo Santos Barrios on 8/24/24.
//

import SwiftUI

/// Displays the tour progress and opens the stop detail view.
struct TourProgressView: View {
    @EnvironmentObject var tourViewModel: TourViewModel
    var tour: Tour { tourViewModel.tour }
    var nextStop: Stop { tour.nextStop }
    var body: some View {
        VStack(spacing: 0) {
            Text(nextStop.emoji)
                .font(.title)
                .padding(Sizes.p20)
                .background(.lightBackground)
                .clipShape(Circle())
                .offset(y: Sizes.p24)
                .zIndex(1)
            VStack {
                
                Text(tour.nextStop.name).font(.title3).bold()
                Button("Siguiente") {
                    tourViewModel.nextStop()
                }
                .buttonStyle(BorderedProminentButtonStyle())
            }
            .padding(.vertical, Sizes.p20)
            .padding(.top, Sizes.p20) // Give space to the emoji
            .frame(maxWidth: .infinity)
            .background(Color.background)
            .cornerRadius(25.0)
            
        }
    }
}

#Preview {
    let tour = LocalToursDatasource.tours[0]
    let sensorsRepository = SensorRepositoryImpl(datasource: SocketIOSensorDatasource())
    let tourViewModel = TourViewModel(tour: tour, sensorsRepository: sensorsRepository)
    return ZStack(alignment: .bottom) {
        Color.gray.ignoresSafeArea()
        TourProgressView()
            .environmentObject(tourViewModel)
        
    }
    
}
