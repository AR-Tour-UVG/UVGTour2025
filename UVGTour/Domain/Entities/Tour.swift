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
    private(set) var stops: [Stop]
    var currentStop: Stop? = nil
    var nextStop: Stop {
        guard let currentStop else { return stops[0] }
        // Get index for the currentStop
        let index = stops.firstIndex { s in
            s.id == currentStop.id
        }
        if index! + 1 >= stops.count { return stops[0] }    // Fall back to first stop
        return stops[index! + 1]
    }
    
    /// Exposes the total of stops the user has completed
    var progress: Int {
        let completeStops = stops.filter { $0.completed }
        return completeStops.count
    }
    
    mutating func completeStop() {
        currentStop = nextStop
        if let currentStop, let currentStopIndex = stops.firstIndex(of: currentStop) {
            stops[currentStopIndex].complete()
        }
    }
}



/// A data representation for a stop.
///
/// A stop in this context is a place of interest on the Campus. For example, the Library.
struct Stop: Identifiable, Equatable {
    var id: String { name }
    let name: String
    let description: String
    let emoji: String
    let sensorId: String
    private(set) var completed: Bool = false
    
    mutating func complete() {
        self.completed = true
    }
}
