//
//  Tour.swift
//  UVGTour
//
//  Created by Guillermo Santos Barrios on 8/17/24.
//

import Foundation


/// A data representation of a tour.
///
/// A user can complete a Tour by following the stops.
struct Tour: Identifiable, Equatable {
    var id: String
    let name: String
    let description: String
    let duration: Duration
}
