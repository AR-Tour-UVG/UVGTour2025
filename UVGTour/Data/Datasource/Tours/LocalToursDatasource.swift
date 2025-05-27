//
//  LocalToursDatasource.swift
//  UVGTour
//
//  Created by Guillermo Santos Barrios on 8/18/24.

// Updated by Diego Leiva on 27/5/25
//

import Foundation


// Posibles direcciones
enum Direction {
    case norte
    case noreste
    case este
    case sureste
    case sur
    case suroeste
    case oeste
    case noroeste

    var radians: Float {
        switch self {
        case .norte: return 0
        case .noreste: return 45
        case .este: return 90
        case .sureste: return 135
        case .sur: return 180
        case .suroeste: return 225
        case .oeste: return 270
        case .noroeste: return 315
        }
    }
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
                    description: "Tour de prueba de funcionalidad de app",
                    emoji: "🟢",
                    sensorId: "c6d9a39a2dd2daf6898f06a82e5d642f",
                    nextStopDirection: Direction.norte.radians,
                    imageName: nil,
                    isWaypoint: false
                    
                ),
                
                Stop(
                    name: "Sensor2",
                    description: "Waypoint only",
                    emoji: "🟡",
                    sensorId: "51e3b3def31fdc943735915249be6610",
                    nextStopDirection: Direction.sur.radians,
                    imageName: nil,
                    isWaypoint: true
                ),
                
                Stop(
                    name: "Sensor3",
                    description: "Waypoint only",
                    emoji: "🔴",
                    sensorId: "5d41cbaa8d563dfc9652cc1ce6cb920d",
                    nextStopDirection: Direction.este.radians,
                    imageName: nil,
                    isWaypoint: false
                )
            ])
    
    ]
    
    func fetchAllTours() async throws -> [Tour] {
        return LocalToursDatasource.tours
    }
    
}
