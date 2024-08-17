//
//  UVGTourApp.swift
//  UVGTour
//
//  Created by Guillermo Santos Barrios on 8/17/24.
//

import SwiftUI

@main
struct UVGTourApp: App {

    var body: some Scene {
        let datasource = SocketIOSensorDatasource()
        let repository = SensorRepositoryImpl(datasource: datasource)
        let useCase = WatchSensorsUseCase(sensorsRepository: repository)
        let viewModel = TestSensorViewModel(watchSensorsUseCase: useCase)
        WindowGroup {
            TestSensorScreen(viewModel: viewModel)
        }
    }
}
