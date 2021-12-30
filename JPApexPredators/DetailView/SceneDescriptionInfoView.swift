//
//  SceneDescriptionInfoView.swift
//  JPApexPredators
//
//  Created by Michael McGrath on 12/29/21.
//

import SwiftUI

struct SceneDescriptionInfoView: View {

    let movieSceneDescriptions: [MovieSceneDescription]
    let sourceLink: String
    @Environment(\.openURL) private var openURL

    var body: some View {
        VStack(alignment: .leading, spacing: AppAppearence.standardMarginSpacing) {
            ForEach(movieSceneDescriptions) { movieSceneDescription in
                Text(movieSceneDescription.movie)
                    .font(.headline.bold())
                    .foregroundColor(.primary)
                Text(movieSceneDescription.sceneDescription)
                    .font(.headline)
                    .foregroundColor(.secondary)
            }
            if let url = URL(string: sourceLink) {
                Link(sourceLink, destination: url)
                    .environment(\.openURL, OpenURLAction { url in
                        openURL(url)
                        return .handled
                    })
            }
        }
    }
}

struct SceneDescriptionInfoView_Previews: PreviewProvider {
    static let mosasaurJWorld = """
    Gray and Zach Mitchell attended the Mosasaur Feeding Show and the Underwater Observatory in which they saw the Mosasaurus consume a shark.

    Following the escape of The Aviary's residents from their enclosure, the Mosasaurus devoured a Pteranodon that was flying over its enclosure to capture Zara Young, also eating Zara, who was in the talons of the Pteranodon.

    At the end of the battle between the Indominus rex, the park's veteran T. rex, and Blue the Velociraptor, the Mosasaurus beached itself to catch the hybrid in its jaws and dragged it to the bottom of the lagoon, thus killing it.
    """

    static let mosasaurFallenKingdom = """
    It is revealed that the individual Mosasaurus seen in Jurassic World has survived the months it has spent on Isla Nublar. It was thought to be dead when the submarine went in to collect a sample of what was left of Indominus rex. The Mosasaurus then ate the sub, along with a mercenary trying to escape on a helicopter, and when the gates were left open, it escaped the lagoon and swam into the ocean. It was last seen trying to eat surfers off of a coast.
    """

    static let mosasaurMovieDescriptions: [MovieSceneDescription] = [
        MovieSceneDescription(movie: .jurasicWorld, sceneDescription: mosasaurJWorld),
        MovieSceneDescription(movie: .fallenKingdom, sceneDescription: mosasaurFallenKingdom),
    ]

    static var previews: some View {
        SceneDescriptionInfoView(movieSceneDescriptions: mosasaurMovieDescriptions, sourceLink: "https://jurassicpark.fandom.com/wiki/Mosasaurus")
    }
}
