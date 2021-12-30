//
//  SortMenuView.swift
//  JPApexPredators
//
//  Created by Michael McGrath on 12/28/21.
//

import SwiftUI

struct SortMenuView: View {

    /// An `EnvironmentObject` of the apex predator view model injected into the app environment accessible by any sub view which declares this property just as below
    @EnvironmentObject var apexPredatorsViewModel: ApexPredatorsViewModel

    /// Used to bind our sorting menu views selection to our view models selected sort option property
    @Binding var selectedSortingOption: SortingOption

    var body: some View {
        Menu {
            Picker(selection: $selectedSortingOption) {
                ForEach(SortingOption.allCases) { option in
                    Label(option.title, image: option.iconImageName)
                        .tag(option)
                }
            } label: {
                Label("Sort by Name", image: "SortLabelIcon")
            }
            .pickerStyle(MenuPickerStyle())
        } label: {
            Image("SortIcon")
                .resizable()
                .frame(width: AppAppearenceConstants.menuItemIconSize, height: AppAppearenceConstants.menuItemIconSize, alignment: .center)
                .foregroundColor(.primary)
        }
    }

    private func updateSortingOption(sortingOption: SortingOption) {
        apexPredatorsViewModel.selectedSortingOption = sortingOption
    }
}

struct SortMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SortMenuView(selectedSortingOption: .constant(.alphabeticallyAscending))
            .environmentObject(ApexPredatorsViewModel())
    }
}
