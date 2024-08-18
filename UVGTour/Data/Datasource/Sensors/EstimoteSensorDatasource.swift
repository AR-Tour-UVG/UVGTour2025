//
//  EstimoteSensorDatasource.swift
//  UVGTour
//
//  Created by Guillermo Santos Barrios on 8/17/24.
//

import Foundation
import Combine
/// Datasource that integrates Estimote's sensor API.
struct EstimoteSensorDatasource: SensorRepository {
    var sensorsPublisher: AnyPublisher<[Sensor], Never> {
        fatalError("Not Implemented")
    }
}
