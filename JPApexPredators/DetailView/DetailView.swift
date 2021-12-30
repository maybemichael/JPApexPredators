//
//  DetailView.swift
//  JPApexPredators
//
//  Created by Michael McGrath on 12/27/21.
//

import SwiftUI

struct DetailView: View {

    let apexPredator: ApexPredator

    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                DetailTopImageView(apexPredator: apexPredator)
                Spacer(minLength: AppAppearence.standardMarginSpacing)
                SceneDescriptionInfoView(movieSceneDescriptions: apexPredator.movieSceneDescriptions, sourceLink: apexPredator.link)
            }
            .padding(.horizontal, AppAppearence.standardMarginSpacing)
        }
        .navigationBarTitleDisplayMode(.inline)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(apexPredator: ApexPredator(id: 0, name: "Velociraptor", type: .land, movies: [.jurasicPark, .theLostWorld, .jurasicParkIII, .jurasicWorld, .fallenKingdom], movieSceneDescriptions: [MovieSceneDescription(movie: .jurasicPark, sceneDescription: "Some Scene Description")], link: "https://jurassicpark.fandom.com/wiki/Velociraptor"))
    }
}
