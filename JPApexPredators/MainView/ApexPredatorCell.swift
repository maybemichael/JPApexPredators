//
//  ApexPredatorCell.swift
//  JPApexPredators
//
//  Created by Michael McGrath on 12/27/21.
//

import SwiftUI

struct ApexPredatorCell: View {

    let apexPredator: ApexPredator

    var body: some View {
        HStack {
            VStack {
                Spacer()
                Image(apexPredator.image)
                    .resizable()
                    .frame(width: AppAppearence.cellImageSize, height: AppAppearence.cellImageSize, alignment: .center)
                    .cornerRadius(AppAppearence.cellImageCornerRadius)
                Spacer()
            }
            VStack(alignment: .leading) {
                Text(apexPredator.name)
                    .lineLimit(1)
                    .foregroundColor(.primary)
                Text(apexPredator.type.typeTitle)
                    .lineLimit(1)
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxHeight: .infinity)
    }
}

struct ApexPredatorCell_Previews: PreviewProvider {
    static var previews: some View {
        ApexPredatorCell(apexPredator: ApexPredator(id: 0, name: "Velociraptor", type: .land, movies: [.jurasicPark, .theLostWorld, .jurasicParkIII, .jurasicWorld, .fallenKingdom], movieSceneDescriptions: [MovieSceneDescription(movie: .jurasicPark, sceneDescription: "Some Scene Description")], link: "https://jurassicpark.fandom.com/wiki/Velociraptor"))
    }
}
