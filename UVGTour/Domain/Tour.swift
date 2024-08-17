//
//  Tour.swift
//  UVGTour
//
//  Created by Guillermo Santos Barrios on 8/17/24.
//

import Foundation


/// A data representation of a tour. This tour can be followed and completed.
struct Tour: Identifiable {
    var id: ObjectIdentifier
    let name: String
    let description: String
    let duration: Duration
}
