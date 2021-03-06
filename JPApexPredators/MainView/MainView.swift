//
//  MainView.swift
//  JPApexPredators
//
//  Created by Michael McGrath on 12/27/21.
//

import SwiftUI

struct MainView: View {

    /// An `EnvironmentObject` of the apex predator view model injected into the app environment accessible by any sub view which declares this property just as below
    @EnvironmentObject var apexPredatorsViewModel: ApexPredatorsViewModel

    var body: some View {
        NavigationView {
            List(apexPredatorsViewModel.displayedApexPredators) { apexPredator in
                NavigationLink(destination: DetailView(apexPredator: apexPredator)) {
                    ApexPredatorCell(apexPredator: apexPredator)
                }
                .navigationTitle(AppAppearenceConstants.mainViewNavigationTitle)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    FilterMenuView(filteredMovieSelection: $apexPredatorsViewModel.selectedMovieFilter, filteredTypeSelection: $apexPredatorsViewModel.selectedTypeFilter)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    SortMenuView(selectedSortingOption: $apexPredatorsViewModel.selectedSortingOption)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
