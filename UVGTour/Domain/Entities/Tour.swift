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
        if index! + 1 > stops.count { return stops[0] }    // Fall back to first stop
        return stops[min(index! + 1, stops.count - 1)]
    }
    
    var completed: Bool {
        stops.filter {$0.completed}.count == stops.count
    }
    
    var willBeCompleted: Bool {
        stops.filter {$0.completed}.count == stops.count - 1
    }
    
    /// Exposes the total of stops the user has completed
    var progress: Int {
        let completeStops = stops.filter { $0.completed }
        return completeStops.count
    }
    
    
    /// Marks a ``Stop`` as completed.
    mutating func completeStop() {
        currentStop = nextStop
        if let currentStop, let currentStopIndex = stops.firstIndex(of: currentStop) {
            stops[currentStopIndex].complete()
        }
    }
    
    /// Marks a ``Stop`` as visited.
    ///
    /// A stop is visited if the user has been near it.
    mutating func visited(_ stop: Stop) {
        guard let index = self.stops.firstIndex(where: { s in
            s.id == stop.id
        }) else { return }
        self.stops[index].visit()
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
    let nextStopDirection: Float // Direction to the next stop in radians. 0 indicates the north and pi is south. Counter clock wise
    private(set) var completed: Bool = false
    private(set) var visited: Bool = false
    
    /// Marks the stop as completed
    mutating func complete() {
        self.completed = true
    }
    
    
    /// Indicates that the user has visited the stop. Meaning that the sensors detected them at least one time in less than 1 meter from it.
    mutating func visit() {
        self.visited = true
    }
}
