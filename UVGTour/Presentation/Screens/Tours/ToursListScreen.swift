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
    @Binding var show: Bool
    @State var showStartTourAlert: Bool = false
    @State var selectedTour: Tour? = nil
    @State private var hasPlayedWelcomeAudio = false
    
    
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
            Button(NSLocalizedString("Start", comment: "")) {
                tourSelection.selectedTour = selectedTour
                show = false
                
                // audio player
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    TourAudioPlayer.play(audioNamed: "tour_guide")
                }
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
        ToursListScreen(viewModel: ToursListViewModel(useCase: useCase), show: .constant(true))
            .navigationTitle("Tours")
            .environmentObject(tourSelection)
    })
    
}
