//
//  TourViewModel.swift
//  UVGTour
//
//  Created by Guillermo Santos Barrios on 8/24/24.
//

import Foundation
import Combine

class TourViewModel: ObservableObject {
    // MARK: State
    @Published private(set) var tour: Tour
    
    
    init(tour: Tour) {
        self.tour = tour
    }
    
    
    func nextStop() {
        self.tour.completeStop()
    }
}
