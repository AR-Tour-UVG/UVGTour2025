//
//  LocalToursDatasource.swift
//  UVGTour
//
//  Created by Guillermo Santos Barrios on 8/18/24.

// Updated by Diego Leiva on 27/5/25
//

import Foundation

func degreesToRadians(degrees: Float) -> Float {
    return degrees * Float.pi / 180
}


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
                    description: "Inicio del Tour",
                    emoji: "🟢",
                    sensorId: "c6d9a39a2dd2daf6898f06a82e5d642f",
                    nextStopDirection: degreesToRadians(degrees: 60),
                    imageName: nil,
                    isWaypoint: false
                    
                ),
                
                Stop(
                    name: "Sensor2",
                    description: "Waypoint",
                    emoji: "🟡",
                    sensorId: "51e3b3def31fdc943735915249be6610",
                    nextStopDirection: degreesToRadians(degrees: 150),
                    imageName: nil,
                    isWaypoint: true
                ),
                
                Stop(
                    name: "Sensor3",
                    description: "Punto Medio",
                    emoji: "🔴",
                    sensorId: "5d41cbaa8d563dfc9652cc1ce6cb920d",
                    nextStopDirection: degreesToRadians(degrees: 145),
                    imageName: nil,
                    isWaypoint: false
                ),
                
                Stop(
                    name: "Sensor4",
                    description: "Waypoint",
                    emoji: "🟡",
                    sensorId: "5d41cbaa8d563dfc9652cc1ce6cb920d",
                    nextStopDirection: degreesToRadians(degrees: 35),
                    imageName: nil,
                    isWaypoint: true
                ),
                
                Stop(
                    name: "Sensor5",
                    description: "Waypoint",
                    emoji: "🟡",
                    sensorId: "5d41cbaa8d563dfc9652cc1ce6cb920d",
                    nextStopDirection: degreesToRadians(degrees: 110),
                    imageName: nil,
                    isWaypoint: true
                ),
                
                Stop(
                    name: "Sensor6",
                    description: "Destino",
                    emoji: "🔴",
                    sensorId: "5d41cbaa8d563dfc9652cc1ce6cb920d",
                    nextStopDirection: 0,
                    imageName: nil,
                    isWaypoint: false
                )
            ])
    
    ]
    
    func fetchAllTours() async throws -> [Tour] {
        return LocalToursDatasource.tours
    }
    
}
