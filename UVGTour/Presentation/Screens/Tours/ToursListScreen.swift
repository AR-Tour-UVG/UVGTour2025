//
//  ToursListScreen.swift
//  UVGTour
//
//  Created by Guillermo Santos Barrios on 8/18/24.
//

import SwiftUI

/// A screen to display and allow the selection of a tour.
struct ToursListScreen: View {
    @EnvironmentObject var tourSelection: TourSelection
    @StateObject var viewModel: ToursListViewModel
    @State var showStartTourAlert: Bool = false
    @State var selectedTour: Tour? = nil
    
    var body: some View {
        List(viewModel.tours) { tour in
            VStack(alignment: .leading) {
                Text(tour.name)
                Text(tour.description)
            }.onTapGesture {
                showStartTourAlert = true
                selectedTour = tour
            }
        }
        .confirmationDialog("Start tour", isPresented: $showStartTourAlert) {
            Button("Start") {
                tourSelection.selectedTour = selectedTour
            }
        }
    }
}

#Preview {
    let datasource = LocalToursDatasource()
    let repository = ToursRepositoryImpl(datasource: datasource)
    let useCase = ListToursUseCase(toursRepository: repository)
    let tourSelection = TourSelection()
    return NavigationView(content: {
        ToursListScreen(viewModel: ToursListViewModel(useCase: useCase))
            .navigationTitle("Tours")
            .environmentObject(tourSelection)
    })
    
}
