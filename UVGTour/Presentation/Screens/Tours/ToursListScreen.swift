//
//  ToursListScreen.swift
//  UVGTour
//
//  Created by Guillermo Santos Barrios on 8/18/24.
//

import SwiftUI

struct ToursListScreen: View {
    @StateObject var viewModel: ToursListViewModel
    
    var body: some View {
        List(viewModel.tours) { tour in
            VStack(alignment: .leading) {
                Text(tour.name)
                Text(tour.description)
                
            }
        }
    }
}

#Preview {
    let datasource = LocalToursDatasource()
    let repository = ToursRepositoryImpl(datasource: datasource)
    let useCase = ListToursUseCase(toursRepository: repository)
    return NavigationView(content: {
        ToursListScreen(viewModel: ToursListViewModel(useCase: useCase))
            .navigationTitle("Tours")
    })
    
}
