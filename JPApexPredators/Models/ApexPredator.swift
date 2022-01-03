//
//  ApexPredator.swift
//  JPApexPredators
//
//  Created by Michael McGrath on 12/27/21.
//

import Foundation

enum SortingOption: Int, CaseIterable, Identifiable {
    case alphabeticallyAscending
    case alphabeticallyDescending
    case random

    /// Needed to conform to the `Identifiable` protocol
    var id: Int {
        switch self {
        case .alphabeticallyAscending, .alphabeticallyDescending, .random:
            return rawValue
        }
    }

    var title: String {
        switch self {
        case .alphabeticallyAscending:
            return "Ascending Order"
        case .alphabeticallyDescending:
            return "Descending Order"
        case .random:
            return "Random Order"
        }
    }

    var iconImageName: String {
        switch self {
        case .alphabeticallyAscending:
            return "AscendingSortIcon"
        case .alphabeticallyDescending:
            return "DescendingSortIcon"
        case .random:
            return "ShuffleIcon"
        }
    }
}

enum ApexPredatorType: Int, Codable, CaseIterable, Identifiable {
    case air
    case land
    case sea

    /// Needed to conform to the `Identifiable` protocol
    var id: Int {
        switch self {
        case .air, .land, .sea:
            return rawValue
        }
    }

    var typeTitle: String {
        switch self {
        case .air:
            return "Air"
        case .land:
            return "Land"
        case .sea:
            return "Sea"
        }
    }

    var iconImageName: String {
        switch self {
        case .air:
            return "AirIcon"
        case .land:
            return "LandIcon"
        case .sea:
            return "SeaIcon"
        }
    }

    var backgroundImageName: String {
        switch self {
        case .air:
            return "AirBackground"
        case .land:
            return "LandBackground"
        case .sea:
            return "SeaBackground"
        }
    }
}

enum JurasicParkMovie: Int, Codable, CaseIterable, Identifiable {
    case jurasicPark
    case theLostWorld
    case jurasicParkIII
    case jurasicWorld
    case fallenKingdom

    /// Needed to conform to the `Identifiable` protocol
    var id: Int {
        switch self {
        case .jurasicPark, .theLostWorld, .jurasicParkIII, .jurasicWorld, .fallenKingdom:
            return rawValue
        }
    }

    var movieTitle: String {
        switch self {
        case .jurasicPark:
            return "Jurassic Park"
        case .theLostWorld:
            return "The Lost World: Jurassic Park"
        case .jurasicParkIII:
            return "Jurassic Park III"
        case .jurasicWorld:
            return "Jurassic World"
        case .fallenKingdom:
            return "Jurassic World: Fallen Kingdom"
        }
    }

    var iconImageName: String {
        switch self {
        case .jurasicPark, .theLostWorld, .jurasicParkIII, .jurasicWorld, .fallenKingdom:
            return "FilmReelIcon"
        }
    }
}

struct ApexPredator: Codable, Identifiable, Equatable {

    let id: Int
    let name: String
    let type: ApexPredatorType
    let movies: [JurasicParkMovie]
    var movieSceneDescriptions: [MovieSceneDescription]
    let link: String
    let image: String


    init(id: Int, name: String, type: ApexPredatorType, movies: [JurasicParkMovie], movieSceneDescriptions: [MovieSceneDescription], link: String) {
        self.id = id
        self.name = name
        self.type = type
        self.movies = movies
        self.movieSceneDescriptions = movieSceneDescriptions
        self.link = link
        self.image = name
    }
}
