//
//  DetailTopImageView.swift
//  JPApexPredators
//
//  Created by Michael McGrath on 12/30/21.
//

import SwiftUI

struct DetailTopImageView: View {

    let apexPredator: ApexPredator
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppAppearence.standardSiblingViewSpacing) {
            ZStack {
                Image(apexPredator.type.backgroundImageName)
                    .resizable()
                Image(apexPredator.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(maxWidth: .infinity, maxHeight: AppAppearence.detailViewImageHeight, alignment: .center)
            Text(apexPredator.name)
                .font(.title.bold())
                .foregroundColor(.primary)
            HStack(alignment: .center, spacing: AppAppearence.standardSiblingViewSpacing) {
                Text("Type:")
                    .font(.headline.bold())
                    .foregroundColor(.primary)
                Text(apexPredator.type.typeTitle)
                    .font(.headline)
                    .foregroundColor(.secondary)
            }
            HStack(alignment: .firstTextBaseline) {
                Text("Appears in:")
                    .font(.headline.bold())
                    .foregroundColor(.primary)
                VStack(alignment: .leading) {
                    ForEach(apexPredator.movies) { movie in
                        Text(movie.movieTitle)
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
    }
}

struct DetailTopImageView_Previews: PreviewProvider {
    static var previews: some View {
        DetailTopImageView(apexPredator: ApexPredator(id: 6, name: "Mosasaurus", type: .sea, movies: [.jurasicWorld, .fallenKingdom], movieSceneDescriptions: [MovieSceneDescription(movie: .jurasicWorld, sceneDescription: "Some Description")], link: "https://jurassicpark.fandom.com/wiki/Mosasaurus"))
    }
}
