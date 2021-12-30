//
//  MovieSceneDescription.swift
//  JPApexPredators
//
//  Created by Michael McGrath on 12/29/21.
//

import Foundation

struct MovieSceneDescription: Codable, Equatable, Identifiable {
    /// Needed to conform to the `Identifiable` protocol
    let id: UUID
    let movie: String
    let sceneDescription: String

    init(movie: JurasicParkMovie, sceneDescription: String) {
        self.movie = movie.movieTitle
        self.sceneDescription = sceneDescription
        self.id = UUID()
    }
}
