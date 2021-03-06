//
//  ApexPredatorsViewModel.swift
//  JPApexPredators
//
//  Created by Michael McGrath on 12/27/21.
//

import Foundation
import SwiftUI


class ApexPredatorsViewModel: ObservableObject {

    /// A published property of `[ApexPredator]` that we use to display in the main views list.
    @Published var displayedApexPredators: [ApexPredator] = []

    /// The `SortingOption` the user has currently selected which is used to sort displayed dinos in ascending, descending, or a random order.
    @Published var selectedSortingOption: SortingOption = .random {
        didSet {
            sortAndUpdate(apexPredators: displayedApexPredators, sortedBy: selectedSortingOption)
        }
    }

    /// The `ApexPredatorType` the user has currently selected which is used to filter out all dinos that are not of this type.
    @Published var selectedTypeFilter: ApexPredatorType? {
        didSet {
            if let selectedTypeFilter = selectedTypeFilter, selectedTypeFilter == oldValue {
                self.selectedTypeFilter = nil
            } else {
                filterDinosBySelectedFilters()
            }
        }
    }

    /// The `JurassicParkMovie` the user has currently selected which is used to filter out all dinos that did not appear in the movie.
    @Published var selectedMovieFilter: JurasicParkMovie? {
        didSet {
            if let selectedMovieFilter = selectedMovieFilter, selectedMovieFilter == oldValue {
                self.selectedMovieFilter = nil
            } else {
                filterDinosBySelectedFilters()
            }
        }
    }

    /// An array containing all of the `ApexPredator` objects used to filter or reset the displayedApexPredators which are used in our views.
    private var allApexPredators: [ApexPredator] = [] {
        didSet {
            update(apexPredators: allApexPredators)
        }
    }

    init() {
        decodeApexPredatorData()
    }

    /// Sorts the passed in array of `ApexPredator's`by their name in a specific order based on the passed in `SortingOption`. The potential sorting options are alphabetically ascending/descending, or a randomly shuffled order.
    private func sortAndUpdate(apexPredators dinos: [ApexPredator], sortedBy sortingOption: SortingOption) {
        switch sortingOption {
        case .alphabeticallyAscending:
            let sortedDinos = dinos.sorted(by: { $0.name < $1.name })
            update(apexPredators: sortedDinos)
        case .alphabeticallyDescending:
            let sortedDinos = dinos.sorted(by: { $0.name > $1.name })
            update(apexPredators: sortedDinos)
        case .random:
            let randomizedDinos = dinos.shuffled()
            update(apexPredators: randomizedDinos)
        }
    }

    /// Filters the passed in array of `ApexPredator's` to only ones that appeared in the passed in `JurassicParkMovie`, or returns the exact same passed in array if the movie is `.none`
    private func filter(apexPredators dinos: [ApexPredator], byMovie movie: JurasicParkMovie?) -> [ApexPredator] {
        guard let movie = movie else { return dinos }

        return dinos.filter {
            return $0.movies.contains(movie)
        }
    }

    /// Filters the passed in array of `ApexPredator's` to only ones that match the passed in `ApexPredatorType`, or returns the exact same passed in array if the type is `.none`
    private func filter(apexPredators dinos: [ApexPredator], byType type: ApexPredatorType?) -> [ApexPredator] {
        guard let type = type else { return dinos }

        return dinos.filter {
            return $0.type == type
        }
    }

    /// Used to filter all dinos by both the movie and type filters the user has currently selected, as well as sort the filtered results by the select sort option the user has select, then safely updates the displayedApexPredators array on the main thread.
    private func filterDinosBySelectedFilters() {
        // When referring to an enum type optional .none is the equivalent of nil so the below is the same as selectedMovieFilter == nil
        let hasNoMovieFilter: Bool = selectedMovieFilter == .none
        let hasNoTypeFilter: Bool = selectedTypeFilter == .none
        switch (hasNoMovieFilter, hasNoTypeFilter) {
        case (true, true):
            sortAndUpdate(apexPredators: allApexPredators, sortedBy: selectedSortingOption)
        case (true, false):
            let filteredDinos = filter(apexPredators: allApexPredators, byType: selectedTypeFilter)
            sortAndUpdate(apexPredators: filteredDinos, sortedBy: selectedSortingOption)
        case (false, true):
            let filteredDinos = filter(apexPredators: allApexPredators, byMovie: selectedMovieFilter)
            sortAndUpdate(apexPredators: filteredDinos, sortedBy: selectedSortingOption)
        default:
            var filteredDinos = filter(apexPredators: allApexPredators, byType: selectedTypeFilter)
            filteredDinos = filter(apexPredators: filteredDinos, byMovie: selectedMovieFilter)
            sortAndUpdate(apexPredators: filteredDinos, sortedBy: selectedSortingOption)
        }
    }

    /// Safely updates the displayed apex predators on the main thread, which we use to display in our views.
    private func update(apexPredators predators: [ApexPredator]) {
        guard predators != displayedApexPredators else { return }
        DispatchQueue.main.async {
            withAnimation(.easeOut) { self.displayedApexPredators = predators }
        }
    }

    /// Used to decode the `ApexPredator` model objects from the JSON file included in the app bundle and sets the arrays, which triggers the UI to update safely on the main thread.
    private func decodeApexPredatorData() {
        guard
            let url = Bundle.main.url(forResource: "ApexPredators", withExtension: "json"),
            let data = try? Data(contentsOf: url)
        else { return }

        do {
            allApexPredators = try JSONDecoder().decode([ApexPredator].self, from: data)
            DispatchQueue.main.async {
                self.update(apexPredators: self.allApexPredators)
            }
        } catch {
            print("Error decoding bundle file: \(error)")
        }
    }
}
