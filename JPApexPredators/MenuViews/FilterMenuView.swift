//
//  FilterMenuView.swift
//  JPApexPredators
//
//  Created by Michael McGrath on 12/27/21.
//

import SwiftUI

struct FilterMenuView: View {

    /// An `EnvironmentObject` of the apex predator view model injected into the app environment accessible by any sub view which declares this property just as below
    @EnvironmentObject var apexPredatorsViewModel: ApexPredatorsViewModel

    /// Used to bind our filter menu views selection to our view models selected movie filter property
    @Binding var filteredMovieSelection: JurasicParkMovie?

    /// Used to bind our filter menu views selection to our view models selected type filter property
    @Binding var filteredTypeSelection: ApexPredatorType?

    var body: some View {
        Menu {
            VStack {
                Picker(selection: $filteredMovieSelection) {
                    ForEach(JurasicParkMovie.allCases) { movie in
                        Label(movie.movieTitle, image: movie.iconImageName)
                            .tag(movie as JurasicParkMovie?)
                    }
                } label: {
                    Label(AppAppearenceConstants.filterMenuMovieLabelTitle, image: AppAppearenceConstants.MenuIcon.movieFilterLabelIcon.imageName)
                }
                .pickerStyle(MenuPickerStyle())
                Picker(selection: $filteredTypeSelection) {
                    ForEach(ApexPredatorType.allCases) { type in
                        Label(type.typeTitle, image: type.iconImageName)
                            .tag(type as ApexPredatorType?)
                    }
                } label: {
                    Label(AppAppearenceConstants.filterMenuTypeLabelTitle, image: AppAppearenceConstants.MenuIcon.typeFilterLabelIcon.imageName)
                }
                .pickerStyle(MenuPickerStyle())
            }
        } label: {
            Image(AppAppearenceConstants.MenuIcon.filterMenuIcon.imageName)
                .resizable()
                .frame(width: AppAppearenceConstants.menuItemIconSize, height: AppAppearenceConstants.menuItemIconSize, alignment: .center)
                .foregroundColor(.white)
        }
    }
}

struct FilterMenuView_Previews: PreviewProvider {
    static var previews: some View {
        FilterMenuView(filteredMovieSelection: .constant(.jurasicWorld), filteredTypeSelection: .constant(.land))
            .environmentObject(ApexPredatorsViewModel())
    }
}
