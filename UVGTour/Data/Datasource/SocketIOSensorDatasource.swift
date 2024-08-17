//
//  SocketIOSensorDatasource.swift
//  UVGTour
//
//  Created by Guillermo Santos Barrios on 8/17/24.
//

import Foundation
import Combine

/// Datasource that integrates SocketIO for sensor simulation.
struct SocketIOSensorDatasource: SensorRepository {
    var sensorsPublisher: AnyPublisher<[Sensor], Never> {
        Timer.publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .map { _ in
                [Sensor(id: "123", distance: Float.random(in: 0...5)), Sensor(id: "1234", distance: Float.random(in: 0...5))]
            }
            .eraseToAnyPublisher()
    }
    
    
}
