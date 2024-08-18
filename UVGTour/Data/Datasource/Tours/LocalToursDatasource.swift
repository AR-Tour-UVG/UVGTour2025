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
        Tour(id: "1", name: "CIT", description: "Un tour en todas las instalaciones del CIT", duration: .seconds(60 * 30))
    ]
    
    func fetchAllTours() async throws -> [Tour] {
        return LocalToursDatasource.tours
    }
    
}
