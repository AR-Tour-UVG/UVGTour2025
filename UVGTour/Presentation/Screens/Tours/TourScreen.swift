//
//  TourScreen.swift
//  UVGTour
//
//  Created by Guillermo Santos Barrios on 8/24/24.
//

import SwiftUI

/// Screen for allowing the progression of a ``[[Tour]]``
struct TourScreen: View {

    @StateObject var tourViewModel: TourViewModel
   
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            Text("AR arrow here")
            VStack {
                Spacer()
                TourProgressView()
                    .environmentObject(tourViewModel)
            }
        }
        
        
    }
}

#Preview {
    let tour = LocalToursDatasource.tours[0]
    let tourViewModel = TourViewModel(tour: tour)
        
    return NavigationView(content: {
        TourScreen( tourViewModel: tourViewModel)
    })
    
}
