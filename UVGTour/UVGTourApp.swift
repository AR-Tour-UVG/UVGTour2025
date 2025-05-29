//
//  UVGTourApp.swift
//  UVGTour
//
//  Created by Guillermo Santos Barrios on 8/17/24.
//

import SwiftUI

@main
struct UVGTourApp: App {
    @State private var showIntro = true
    
    var body: some Scene {
        let datasource = LocalToursDatasource()
        let repository = ToursRepositoryImpl(datasource: datasource)
        let useCase = ListToursUseCase(toursRepository: repository)
        let viewModel = ToursListViewModel(useCase: useCase)
        let tourSelection = TourSelection()
        
        WindowGroup {
            if showIntro {
                IntroScreen {
                    showIntro = false
                }
            } else {
                TourScreen(
                    tourViewModel: TourViewModel(
                        tour: LocalToursDatasource.tours[0],
                        sensorsRepository: SensorRepositoryImpl(datasource: EstimoteSensorDatasource())
                    )
                )
                .environmentObject(tourSelection)
            }
        }
    }
}
