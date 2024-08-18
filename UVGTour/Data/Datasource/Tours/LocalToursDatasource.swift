//
//  LocalToursDatasource.swift
//  UVGTour
//
//  Created by Guillermo Santos Barrios on 8/18/24.
//

import Foundation


/// Datasource with tours stored locally.
struct LocalToursDatasource: ToursRepository {
    
    public static let tours: [Tour] = [
        Tour(id: "1", name: "CIT".hardcoded, description: "Un tour en todas las instalaciones del CIT".hardcoded, duration: .seconds(60 * 30)),
        Tour(id: "2", name: "Biblioteca".hardcoded, description: "Conoce las instalaciones de la biblioteca".hardcoded, duration: .seconds(60 * 30))
    ]
    
    func fetchAllTours() async throws -> [Tour] {
        return LocalToursDatasource.tours
    }
    
}
