//
//  LocalToursDatasource.swift
//  UVGTour
//
//  Created by Guillermo Santos Barrios on 8/18/24.
//

import Foundation

// Yellow - 4056668d19dfe5fab47c9e83c82a982b
// Brown - 8cc2e0a06f1666b863df2ea773e7ad02
// White - fd7d34c180ba4e9610a4439cd205712c
/// Datasource with tours stored locally.
struct LocalToursDatasource: ToursRepository {
    
    public static let tours: [Tour] = [
        Tour(
            id: "1",
            name: "CIT".hardcoded,
            description: "Un tour en todas las instalaciones del CIT".hardcoded,
            duration: .seconds(60 * 30),
            stops: [
                Stop(
                    name: "Plaza",
                    description: """
                    La Plaza de la Universidad del Valle de Guatemala (UVG) es el corazón vibrante del campus, un espacio amplio y abierto que simboliza la conexión entre la tradición académica y el dinamismo estudiantil. Rodeada de jardines bien cuidados y edificios emblemáticos, la plaza es un punto de encuentro natural para estudiantes, profesores y visitantes. Aquí, bajo la sombra de árboles frondosos y con el sonido suave del agua de las fuentes cercanas, se llevan a cabo diversas actividades que van desde eventos culturales y ferias estudiantiles hasta ceremonias institucionales. Con su atmósfera relajada y su ubicación central, la Plaza de la UVG no solo es un lugar de tránsito, sino también un espacio para la reflexión, la convivencia y el disfrute del ambiente universitario.
                    """,
                    emoji: "🐲",
                    sensorId: "4056668d19dfe5fab47c9e83c82a982b", nextStopDirection: .pi/2 // osete
                ),
                Stop(name: "Biblioteca", description: "Biblioteca de la uvg", emoji: "📚", sensorId: "8cc2e0a06f1666b863df2ea773e7ad02", nextStopDirection: 0), // norte
                
                Stop(name: "Canchas", description: "Canchas deportivas de la UVG", emoji: "🎾", sensorId: "fd7d34c180ba4e9610a4439cd205712c", nextStopDirection: .pi), // sur
            ]),
        
    ]
    
    func fetchAllTours() async throws -> [Tour] {
        return LocalToursDatasource.tours
    }
    
}
