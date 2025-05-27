//
//  LocalToursDatasource.swift
//  UVGTour
//
//  Created by Guillermo Santos Barrios on 8/18/24.

// Updated by Diego Leiva on 27/5/25
//

import Foundation

/// Datasource with tours stored locally.
struct LocalToursDatasource: ToursRepository {
    
    public static let tours: [Tour] = [
        Tour(
            id: "1",
            name: "TEST".hardcoded,
            description: "Tour de Prueba".hardcoded,
            duration: .seconds(60 * 30),
            stops: [
                Stop(
                    name: "Sensor1",
                    description: "Tour de prueba de funcionalidad de app",
                    emoji: "🟢",
                    sensorId: "c6d9a39a2dd2daf6898f06a82e5d642f",
                    nextStopDirection: -.pi/4,
                    imageName: nil
                    
                ),
                
                Stop(
                    name: "Sensor2",
                    description: "Waypoint only",
                    emoji: "🟡",
                    sensorId: "51e3b3def31fdc943735915249be6610",
                    nextStopDirection: .pi/4,
                    imageName: nil,
                    isWaypoint: true
                ),
                
                Stop(
                    name: "Sensor3",
                    description: "Waypoint only",
                    emoji: "🔴",
                    sensorId: "5d41cbaa8d563dfc9652cc1ce6cb920d",
                    nextStopDirection: .pi/4,
                    imageName: nil
                )
            ])
    
    ]
    
    func fetchAllTours() async throws -> [Tour] {
        return LocalToursDatasource.tours
    }
    
}
