//
//  TourViewModel.swift
//  UVGTour
//
//  Created by Guillermo Santos Barrios on 8/24/24.
//

import Foundation
import Combine

class TourViewModel: ObservableObject {
    // MARK: State
    @Published private(set) var tour: Tour
    @Published private(set) var sensors: [Sensor] = []
    var distanceToStopSensor: Int? {
        let nextStop = tour.nextStop
        let sensor = sensors.first { sensor in
            sensor.id == nextStop.sensorId
        }
        guard let sensor else { return nil }
        return Int(sensor.distance)
    }
    var sensorsRepository: SensorRepository
    var watchSensorsUseCase: WatchSensorsUseCase
    
    
    init(tour: Tour, sensorsRepository: SensorRepository) {
        self.tour = tour
        self.sensorsRepository = sensorsRepository
        self.watchSensorsUseCase = WatchSensorsUseCase(sensorsRepository: sensorsRepository)
        listenToSensors()
    }
    
    
    /// Listen to sensor updates
    func listenToSensors() {
        print("Listening to sensors...")
        self.watchSensorsUseCase.watchSensors { sensors in
            self.sensors = sensors
            if let distanceToStopSensor = self.distanceToStopSensor, distanceToStopSensor <= 0 {
                self.tour.visited(self.tour.nextStop)
            }
        }
    }
    
    
    /// Goes to the next stop.
    func nextStop() {
        self.tour.completeStop()
    }
    
    
    /// Mark a ``[[Stop]]`` as visited
    func visited(stop: Stop) {
        self.tour.visited(stop)
    }
}
