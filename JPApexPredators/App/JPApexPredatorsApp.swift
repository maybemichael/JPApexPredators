//
//  JPApexPredatorsApp.swift
//  JPApexPredators
//
//  Created by Michael McGrath on 12/27/21.
//

import SwiftUI

@main
struct JPApexPredatorsApp: App {

    @ObservedObject var apexPredatorsViewModel = ApexPredatorsViewModel()

    var apexPredators: [ApexPredator] = [
        ApexPredator(id: 0, name: "Velociraptor", type: .land, movies: [.jurasicPark, .theLostWorld, .jurasicParkIII, .jurasicWorld, .fallenKingdom], movieSceneDescriptions: velociraptorMovieDescriptions, link: "https://jurassicpark.fandom.com/wiki/Velociraptor"),
        ApexPredator(id: 1, name: "Tyrannosaurus Rex", type: .land, movies: [.jurasicPark, .theLostWorld, .jurasicParkIII, .jurasicWorld, .fallenKingdom], movieSceneDescriptions: tRexMovieDescriptions, link: "https://jurassicpark.fandom.com/wiki/Tyrannosaurus_rex"),
        ApexPredator(id: 2, name: "Stegosaurus", type: .land, movies: [.theLostWorld, .jurasicParkIII, .jurasicWorld, .fallenKingdom], movieSceneDescriptions: stegosaurusMovieDescriptions, link: "https://jurassicpark.fandom.com/wiki/Stegosaurus"),
        ApexPredator(id: 3, name: "Spinosaurus", type: .land, movies: [.jurasicParkIII], movieSceneDescriptions: spinosaurusMovieDescriptions, link: "https://jurassicpark.fandom.com/wiki/Spinosaurus"),
        ApexPredator(id: 4, name: "Pteranodon", type: .air, movies: [.theLostWorld, .jurasicParkIII, .jurasicWorld, .fallenKingdom], movieSceneDescriptions: pteranodonMovieDescriptions, link: "https://jurassicpark.fandom.com/wiki/Pteranodon"),
        ApexPredator(id: 5, name: "Pachycephalosaurus", type: .land, movies: [.theLostWorld, .jurasicWorld], movieSceneDescriptions: pachcephalosaurusMovieDescriptions, link: "https://jurassicpark.fandom.com/wiki/Pachycephalosaurus"),
        ApexPredator(id: 6, name: "Mosasaurus", type: .sea, movies: [.jurasicWorld, .fallenKingdom], movieSceneDescriptions: mosasaurMovieDescriptions, link: "https://jurassicpark.fandom.com/wiki/Mosasaurus"),
        ApexPredator(id: 7, name: "Indoraptor", type: .land, movies: [.fallenKingdom], movieSceneDescriptions: indoraptorMovieDescriptions, link: "https://jurassicpark.fandom.com/wiki/Indoraptor"),
        ApexPredator(id: 8, name: "Indominus Rex", type: .land, movies: [.jurasicWorld], movieSceneDescriptions: indominusRexMovieDescriptions, link: "https://jurassicpark.fandom.com/wiki/Indominus_rex"),
        ApexPredator(id: 9, name: "Dimorphodon", type: .air, movies: [.jurasicWorld], movieSceneDescriptions: dimorphodonMovieDescriptions, link: "https://jurassicpark.fandom.com/wiki/Dimorphodon"),
        ApexPredator(id: 10, name: "Dilophosaurus", type: .land, movies: [.jurasicPark], movieSceneDescriptions: dilophosaurusMovieDescriptions, link: "https://jurassicpark.fandom.com/wiki/Dilophosaurus"),
        ApexPredator(id: 11, name: "Compsognathus", type: .land, movies: [.theLostWorld, .jurasicParkIII, .fallenKingdom], movieSceneDescriptions: compsognathusMovieDescriptions, link: "https://jurassicpark.fandom.com/wiki/Compsognathus"),
        ApexPredator(id: 12, name: "Brachiosaurus", type: .land, movies: [.jurasicPark, .jurasicParkIII, .fallenKingdom], movieSceneDescriptions: brachiosaurusMovieDescriptions, link: "https://jurassicpark.fandom.com/wiki/Brachiosaurus"),
    ]

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(apexPredatorsViewModel)
        }
    }

    init() {
        adjustVisualAppearance()
//        saveToPersistentStore()
    }

    private func adjustVisualAppearance() {
        var navigationBarLayoutMargins: UIEdgeInsets = .zero
        navigationBarLayoutMargins.left = AppAppearence.standardMarginSpacing
        navigationBarLayoutMargins.right = navigationBarLayoutMargins.left
        UINavigationBar.appearance().layoutMargins = navigationBarLayoutMargins

        var tableViewLayoutMargins: UIEdgeInsets = .zero
        tableViewLayoutMargins.left = AppAppearence.standardMarginSpacing
        tableViewLayoutMargins.right = tableViewLayoutMargins.left
        UITableView.appearance().layoutMargins = tableViewLayoutMargins
    }

    var dinoURL: URL? {
        let fileManager = FileManager.default
        guard let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let dinoURL = documentsDir.appendingPathComponent("ApexPredators.json")
        return dinoURL
    }

    func saveToPersistentStore() {
        guard let dinoURL = dinoURL else { return }

        do {
            let dinoData = try JSONEncoder().encode(apexPredators.shuffled())
            try dinoData.write(to: dinoURL)
            print("Saved successfully to... \(dinoURL)")
        } catch {
            print("Error saving books: \(error).")
        }
    }

    /*
     Jurassic Park -1993
     The Lost World: Jurassic Park - 1997
     Jurassic Park III - 2001
     Jurassic World - 2015
     Jurassic World: Fallen Kingdom - 2018
     */

    static let velociraptorMovieDescriptions: [MovieSceneDescription] = [
        MovieSceneDescription(movie: .jurasicPark, sceneDescription: vRaptorJPark),
        MovieSceneDescription(movie: .theLostWorld, sceneDescription: vRaptorLostWorld),
        MovieSceneDescription(movie: .jurasicParkIII, sceneDescription: vRaptorJPark3),
        MovieSceneDescription(movie: .jurasicWorld, sceneDescription: vRaptorJWorld),
        MovieSceneDescription(movie: .fallenKingdom, sceneDescription: vRaptorFallenKingdom),
    ]

    static let tRexMovieDescriptions: [MovieSceneDescription] = [
        MovieSceneDescription(movie: .jurasicPark, sceneDescription: tRexJPark),
        MovieSceneDescription(movie: .theLostWorld, sceneDescription: tRexLostWorld),
        MovieSceneDescription(movie: .jurasicParkIII, sceneDescription: tRexJPark3),
        MovieSceneDescription(movie: .jurasicWorld, sceneDescription: tRexJWorld),
        MovieSceneDescription(movie: .fallenKingdom, sceneDescription: tRexFallenKingdom),
    ]

    static let stegosaurusMovieDescriptions: [MovieSceneDescription] = [
        MovieSceneDescription(movie: .theLostWorld, sceneDescription: stegLostWorld),
        MovieSceneDescription(movie: .jurasicParkIII, sceneDescription: stegJPark3),
        MovieSceneDescription(movie: .jurasicWorld, sceneDescription: stegJWorld),
        MovieSceneDescription(movie: .fallenKingdom, sceneDescription: stegFallenKingdom),
    ]

    static let spinosaurusMovieDescriptions: [MovieSceneDescription] = [
        MovieSceneDescription(movie: .jurasicParkIII, sceneDescription: spinosaurusJPark3),
    ]

    static let pteranodonMovieDescriptions: [MovieSceneDescription] = [
        MovieSceneDescription(movie: .theLostWorld, sceneDescription: pteranodonLostWorld),
        MovieSceneDescription(movie: .jurasicParkIII, sceneDescription: pteranodonJPark3),
        MovieSceneDescription(movie: .jurasicWorld, sceneDescription: pteranodonJWorld),
        MovieSceneDescription(movie: .fallenKingdom, sceneDescription: pteranodonFallenKingdom),
    ]

    static let pachcephalosaurusMovieDescriptions: [MovieSceneDescription] = [
        MovieSceneDescription(movie: .theLostWorld, sceneDescription: pachcephalosaurusLostWorld),
        MovieSceneDescription(movie: .jurasicWorld, sceneDescription: pachcephalosaurusJWorld),
    ]

    static let mosasaurMovieDescriptions: [MovieSceneDescription] = [
        MovieSceneDescription(movie: .jurasicWorld, sceneDescription: mosasaurJWorld),
        MovieSceneDescription(movie: .fallenKingdom, sceneDescription: mosasaurFallenKingdom),
    ]

    static let indoraptorMovieDescriptions: [MovieSceneDescription] = [
        MovieSceneDescription(movie: .fallenKingdom, sceneDescription: indoraptorFallenKingdom),
    ]

    static let indominusRexMovieDescriptions: [MovieSceneDescription] = [
        MovieSceneDescription(movie: .jurasicWorld, sceneDescription: indominusRexJWorld),
    ]

    static let dimorphodonMovieDescriptions: [MovieSceneDescription] = [
        MovieSceneDescription(movie: .jurasicWorld, sceneDescription: dimorphodonJWorld),
    ]

    static let dilophosaurusMovieDescriptions: [MovieSceneDescription] = [
        MovieSceneDescription(movie: .jurasicPark, sceneDescription: dilophosaurusJPark),
    ]

    static let compsognathusMovieDescriptions: [MovieSceneDescription] = [
        MovieSceneDescription(movie: .theLostWorld, sceneDescription: compsognathusLostWorld),
        MovieSceneDescription(movie: .jurasicParkIII, sceneDescription: compsognathusJPark3),
        MovieSceneDescription(movie: .fallenKingdom, sceneDescription: compsognathusFallenKingdom),
    ]

    static let brachiosaurusMovieDescriptions: [MovieSceneDescription] = [
        MovieSceneDescription(movie: .jurasicPark, sceneDescription: brachiosaurusJPark),
        MovieSceneDescription(movie: .jurasicParkIII, sceneDescription: brachiosaurusJPark3),
        MovieSceneDescription(movie: .fallenKingdom, sceneDescription: brachiosaurusFallenKingdom),
    ]

    static let velociraptorSceneDescription = """
    **Jurassic Park**

    A velociraptor appears in the very first scene in Jurassic Park when Muldoon and his team try to bring a female into the park. It attacks one of the team members and they are forced to shoot it. They don’t appear then until far later in the film when Ellie and Muldoon have to restore the park’s power systems. Muldoon realises they’re being hunted by them and tells Ellie to run to the power shed as he tracks a Velociraptor with his gun. She restores the power and finds what’s left of Ray and she narrowly escapes from a Velociraptor. Muldoon is still tracking a raptor when the female ambushes him, killing him. The raptors appear again in the visitor center when Lex and Tim are eating. They hide in the kitchen and avoid being detected. They managed to trap one of them and escape. The raptors catch up with the group in the control room so Ellie, Dr. Grant, Tim and Lex escape through the vents and into the main lobby area of the visitor center. They fall to the ground and are about to be attacked by two Velociraptors when the Tyrannosaur appears, killing both of them. The survivors use this opportunity to escape the island.

    **The Lost World: Jurassic Park**

    The Velociraptors appear once again towards the end of The Lost World. When Roland’s team escape the Tyrannosaurus at their camp, they wonder into the tall grass. The raptors close in on them and start picking the team off one by one. Dr. Malcolm, Kelly and Sarah make it to the compound in the middle of the island. One of the raptors jumps on Sarah’s backpack and Sarah and Kelly flee into a nearby building with two raptors in pursuit. Malcolm tires to evade the other one by hiding in a nearby building and then inside a car. The other two velociraptors make it inside the building and Sarah and Kelly climb to the top. Kelly uses her acrobatic skills to impale a raptor on a metal pole. They escape through the top of the building with the other one right behind them. It falls off the roof and onto the other raptor on the ground. They start fighting each other which gives Sarah and Kelly the opportunity to escape.

    **Jurassic Park III**

    The film starts off with Dr. Grant and his colleague Billy discussing a Velociraptor’s communicative intelligence. Billy uses a 3D printer to replicate the larynx of a Velociraptor. When Dr. Grant and the group get stranded on the island, his colleague Billy steals two Velociraptor eggs unknown to the others. When the survivors reach the abandoned laboratory, a raptor sneaks in there and attacks Amanda Kirby. The group runs to the cages and traps one of them. We see its communicative abilities when it actually calls the other Velociraptors for help. The survivors run through a group of Corythosaurus and Parasaurolophus and into the forest. Amanda, Paul and Billy hide in the trees while Dr. Grant is still on the ground. The raptors injure Udesky and set a trap to lure the others down from the tree. Amanda Kirby almost falls from the tree but is saved and Dr. Grant is confronted by a Velociraptor. Eric Kirby comes to his rescue and sprays a gas can and the raptors flee.

    We then see the raptors at the climax of the movie when the survivors are making their way back to the beach. The Velociraptors surround the group and the female raptor challenges Amanda Kirby for the eggs that Billy stole earlier. She hands over the eggs and Dr. Grant uses the imitation raptor larynx to fool the raptors into running off. The survivors then escape the island.

    **Jurassic World**

    In Jurassic World, a pack of Velociraptors each with their own names, Blue, Charlie, Delta, and Echo, are trained by Owen Grady. These raptors each have their unique personalities and skin colors and even head anatomy. InGen, the company that cloned the dinosaurs, wants to use the raptors for military applications. This is also the first time raptors developed a personal bond with humans.

    Vic Hoskins convinced the IBRIS Project trainers to utilize the raptors in the pursuit of an escaped Indominus rex. But the raptors began to attack humans as the Indominus rex had raptor DNA and became their alpha. In the chaos, Charlie was blown to bits by a rocket launcher. Delta and Echo then tried to eat Claire Dearing, Gray, and Zach Mitchell in their van. Sometime later, Delta suddenly appeared in the Hammond Creation Lab unexpectedly before Owen, Claire, Hoskins, and the boys. They are forced to flee after the raptor killed Hoskins, who failed at trying to calm her down by copying Owen's hand gesture. After killing Hoskins, Delta continued her pursuit of Owen, Claire and the boys before being distracted by a hologram of a Dilophosaurus activated by Gray, but continued her pursuit after realizing it wasn't real.

    Soon it turned out Blue herded the humans into a trap. Just as they trapped the humans, the Indominus walked into view. The raptors, however, turned on the Indominus as Owen takes off the video camera from Blue's head, realizing that the hybrid was merely using them. As they refought the Indominus with Owen's help, Blue was knocked unconscious while the other raptors were overpowered. Later, Blue regained consciousness and rejoined the fight, lunging at the hybrid and allowing Jurassic World's T. rex that was from the original Jurassic Park park who had joined the battle in her absence, to get back on her feet after she was pushed to the ground by the Indominus rex. Blue helped the T. rex attack the I. rex. Suddenly, the Mosasaurus dragged the I. rex into the bottom of the lagoon. After the fight, the T. rex decides to spare Blue, most likely due to the already extensive injuries caused by Indominus. Blue then turned towards Owen, chirping at him momentarily before disappearing into the night.

    **Jurassic World: Fallen Kingdom**

    Blue the raptor returns in the film Jurassic World: Fallen Kingdom, making her the first returning Velociraptor character. At the beginning of the movie, it shows Owen Grady watching a training video of him, and her pack as infants on a computer. Early in the story, it is revealed that Blue is still alive but she and many other creatures lives are in danger from the impending eruption of Mount Sibo. The decide to attempt a rescue mission to save Blue, the last surviving Velociraptor.

    During the rescue mission, Blue was reunited with Owen by startling him when she screeches loudly at him from behind, perched on top of the damaged Jurassic Park Ford tour van that Alan Grant rescued Tim Murphy from, in a greeting. As she slowly approaches him, she begins to press her nose to his palm, remembering him, before jerking her head away with a sharp cry as Ken Wheatley and a team of mercenaries attempts to capture Blue via tranquilizing her. Owen warns them to back up after they refused to wait for his signal to tranquilize her until Blue attacks one of the nearby soldiers, which results in her getting shot in the hip. She gives a wail of pain before falling over onto her side.

    Once Owen is tranquilized by Wheatley after she is shot, Zia Rodriguez rushes to her rescue, telling the mercenaries that she is the only one who can keep Blue alive. She and Blue are subsequently captured, and taken to the East Dock, where Wheatley and the other animal traffickers have captured the other dinosaurs to ship them back to the mainland for Eli Mills and Henry Wu.

    Inside the back of a military van, Zia and Blue reunite with Owen, Claire, and Franklin to reveal that Blue is hemorrhaging, and will need a blood transfusion from a carnivore with two or three fingers to keep her alive. Owen and Claire end up bringing back blood from the Tyrannosaurus rex, which subsequently saves her life.

    Around the same time, Maisie Lockwood watches a training video with Blue as an infant, showing compassion and empathy for Owen, while he pretends to show signs of weakness in front of her.

    After the Indoraptor's escape, Henry Wu has Franklin, who is disguised as a geneticist to get equipment for him to take blood samples from Blue to create a new batch of Indoraptors, which would subsequently become her children. The plan, however, backfires, as Zia breaks the news to him that Blue's blood is transfused with the Tyrannosaur's, and Franklin stabs him in the neck with a tranquilizer. Two ACU troops attempt to subdue them before Zia releases Blue, who mauls them both, before escaping from the laboratory as it erupts in flames from one of the soldiers' bullets hitting a tank of flammable, toxic, gas.

    Blue, after making her way upstairs inside the Lockwood Manor, attacks the Indoraptor in Maisie's bedroom when she sees him preparing to attack Owen. The two battle for a brief moment before they both fall out of a window, with Blue falling in another direction as the Indoraptor continues to pursue Owen and Maisie.

    Blue then ambushes the Indoraptor from behind on the roof, pouncing on him. The added weight causes them to fall through the skylight, and land on an Agujaceratops skull, which impales, and kills, the Indoraptor. After giving a shriek of victory, Blue jumps off and runs off.

    After the dinosaurs from Nublar are released into the open by Maisie, Blue is approached by Owen, who tells her that he can take her to a sanctuary she would be safe at. However, Blue ends up running off, pausing briefly to look back at Owen, making a gentle noise towards him, before running off into the early morning.

    At the ending of the film, it shows Blue overlooking a far-off, suburban, Californian neighborhood, as she calls out.
    """
    static let vRaptorJPark: String = """
    A velociraptor appears in the very first scene in Jurassic Park when Muldoon and his team try to bring a female into the park. It attacks one of the team members and they are forced to shoot it. They don’t appear then until far later in the film when Ellie and Muldoon have to restore the park’s power systems. Muldoon realises they’re being hunted by them and tells Ellie to run to the power shed as he tracks a Velociraptor with his gun. She restores the power and finds what’s left of Ray and she narrowly escapes from a Velociraptor. Muldoon is still tracking a raptor when the female ambushes him, killing him. The raptors appear again in the visitor center when Lex and Tim are eating. They hide in the kitchen and avoid being detected. They managed to trap one of them and escape. The raptors catch up with the group in the control room so Ellie, Dr. Grant, Tim and Lex escape through the vents and into the main lobby area of the visitor center. They fall to the ground and are about to be attacked by two Velociraptors when the Tyrannosaur appears, killing both of them. The survivors use this opportunity to escape the island.
    """

    static let vRaptorLostWorld: String = """
    The Velociraptors appear once again towards the end of The Lost World. When Roland’s team escape the Tyrannosaurus at their camp, they wonder into the tall grass. The raptors close in on them and start picking the team off one by one. Dr. Malcolm, Kelly and Sarah make it to the compound in the middle of the island. One of the raptors jumps on Sarah’s backpack and Sarah and Kelly flee into a nearby building with two raptors in pursuit. Malcolm tires to evade the other one by hiding in a nearby building and then inside a car. The other two velociraptors make it inside the building and Sarah and Kelly climb to the top. Kelly uses her acrobatic skills to impale a raptor on a metal pole. They escape through the top of the building with the other one right behind them. It falls off the roof and onto the other raptor on the ground. They start fighting each other which gives Sarah and Kelly the opportunity to escape.
    """

    static let vRaptorJPark3: String = """
    The film starts off with Dr. Grant and his colleague Billy discussing a Velociraptor’s communicative intelligence. Billy uses a 3D printer to replicate the larynx of a Velociraptor. When Dr. Grant and the group get stranded on the island, his colleague Billy steals two Velociraptor eggs unknown to the others. When the survivors reach the abandoned laboratory, a raptor sneaks in there and attacks Amanda Kirby. The group runs to the cages and traps one of them. We see its communicative abilities when it actually calls the other Velociraptors for help. The survivors run through a group of Corythosaurus and Parasaurolophus and into the forest. Amanda, Paul and Billy hide in the trees while Dr. Grant is still on the ground. The raptors injure Udesky and set a trap to lure the others down from the tree. Amanda Kirby almost falls from the tree but is saved and Dr. Grant is confronted by a Velociraptor. Eric Kirby comes to his rescue and sprays a gas can and the raptors flee.

    We then see the raptors at the climax of the movie when the survivors are making their way back to the beach. The Velociraptors surround the group and the female raptor challenges Amanda Kirby for the eggs that Billy stole earlier. She hands over the eggs and Dr. Grant uses the imitation raptor larynx to fool the raptors into running off. The survivors then escape the island.
    """

    static let vRaptorJWorld: String = """
    In Jurassic World, a pack of Velociraptors each with their own names, Blue, Charlie, Delta, and Echo, are trained by Owen Grady. These raptors each have their unique personalities and skin colors and even head anatomy. InGen, the company that cloned the dinosaurs, wants to use the raptors for military applications. This is also the first time raptors developed a personal bond with humans.

    Vic Hoskins convinced the IBRIS Project trainers to utilize the raptors in the pursuit of an escaped Indominus rex. But the raptors began to attack humans as the Indominus rex had raptor DNA and became their alpha. In the chaos, Charlie was blown to bits by a rocket launcher. Delta and Echo then tried to eat Claire Dearing, Gray, and Zach Mitchell in their van. Sometime later, Delta suddenly appeared in the Hammond Creation Lab unexpectedly before Owen, Claire, Hoskins, and the boys. They are forced to flee after the raptor killed Hoskins, who failed at trying to calm her down by copying Owen's hand gesture. After killing Hoskins, Delta continued her pursuit of Owen, Claire and the boys before being distracted by a hologram of a Dilophosaurus activated by Gray, but continued her pursuit after realizing it wasn't real.

    Soon it turned out Blue herded the humans into a trap. Just as they trapped the humans, the Indominus walked into view. The raptors, however, turned on the Indominus as Owen takes off the video camera from Blue's head, realizing that the hybrid was merely using them. As they refought the Indominus with Owen's help, Blue was knocked unconscious while the other raptors were overpowered. Later, Blue regained consciousness and rejoined the fight, lunging at the hybrid and allowing Jurassic World's T. rex that was from the original Jurassic Park park who had joined the battle in her absence, to get back on her feet after she was pushed to the ground by the Indominus rex. Blue helped the T. rex attack the I. rex. Suddenly, the Mosasaurus dragged the I. rex into the bottom of the lagoon. After the fight, the T. rex decides to spare Blue, most likely due to the already extensive injuries caused by Indominus. Blue then turned towards Owen, chirping at him momentarily before disappearing into the night.
    """

    static let vRaptorFallenKingdom: String = """
    Blue the raptor returns in the film Jurassic World: Fallen Kingdom, making her the first returning Velociraptor character. At the beginning of the movie, it shows Owen Grady watching a training video of him, and her pack as infants on a computer. Early in the story, it is revealed that Blue is still alive but she and many other creatures lives are in danger from the impending eruption of Mount Sibo. The decide to attempt a rescue mission to save Blue, the last surviving Velociraptor.

    During the rescue mission, Blue was reunited with Owen by startling him when she screeches loudly at him from behind, perched on top of the damaged Jurassic Park Ford tour van that Alan Grant rescued Tim Murphy from, in a greeting. As she slowly approaches him, she begins to press her nose to his palm, remembering him, before jerking her head away with a sharp cry as Ken Wheatley and a team of mercenaries attempts to capture Blue via tranquilizing her. Owen warns them to back up after they refused to wait for his signal to tranquilize her until Blue attacks one of the nearby soldiers, which results in her getting shot in the hip. She gives a wail of pain before falling over onto her side.

    Once Owen is tranquilized by Wheatley after she is shot, Zia Rodriguez rushes to her rescue, telling the mercenaries that she is the only one who can keep Blue alive. She and Blue are subsequently captured, and taken to the East Dock, where Wheatley and the other animal traffickers have captured the other dinosaurs to ship them back to the mainland for Eli Mills and Henry Wu.

    Inside the back of a military van, Zia and Blue reunite with Owen, Claire, and Franklin to reveal that Blue is hemorrhaging, and will need a blood transfusion from a carnivore with two or three fingers to keep her alive. Owen and Claire end up bringing back blood from the Tyrannosaurus rex, which subsequently saves her life.

    Around the same time, Maisie Lockwood watches a training video with Blue as an infant, showing compassion and empathy for Owen, while he pretends to show signs of weakness in front of her.

    After the Indoraptor's escape, Henry Wu has Franklin, who is disguised as a geneticist to get equipment for him to take blood samples from Blue to create a new batch of Indoraptors, which would subsequently become her children. The plan, however, backfires, as Zia breaks the news to him that Blue's blood is transfused with the Tyrannosaur's, and Franklin stabs him in the neck with a tranquilizer. Two ACU troops attempt to subdue them before Zia releases Blue, who mauls them both, before escaping from the laboratory as it erupts in flames from one of the soldiers' bullets hitting a tank of flammable, toxic, gas.

    Blue, after making her way upstairs inside the Lockwood Manor, attacks the Indoraptor in Maisie's bedroom when she sees him preparing to attack Owen. The two battle for a brief moment before they both fall out of a window, with Blue falling in another direction as the Indoraptor continues to pursue Owen and Maisie.

    Blue then ambushes the Indoraptor from behind on the roof, pouncing on him. The added weight causes them to fall through the skylight, and land on an Agujaceratops skull, which impales, and kills, the Indoraptor. After giving a shriek of victory, Blue jumps off and runs off.

    After the dinosaurs from Nublar are released into the open by Maisie, Blue is approached by Owen, who tells her that he can take her to a sanctuary she would be safe at. However, Blue ends up running off, pausing briefly to look back at Owen, making a gentle noise towards him, before running off into the early morning.

    At the ending of the film, it shows Blue overlooking a far-off, suburban, Californian neighborhood, as she calls out.
    """

    // MARK: - Complete
    static let trexSceneDescriptions = """
    **Jurassic Park**

    When the inspection team constituting of vertebrate paleontologist Dr. Alan Grant, paleobotanist Dr. Ellie Sattler, chaotician Dr. Ian Malcolm, lawyer Donald Gennaro, and John Hammond's grandchildren Lex and Tim Murphy took a tour of Jurassic Park, initially the Tyrannosaurus was a no-show. Although computer technician Ray Arnold attempted to lure her to her paddock fence by tantalizing her with a goat, the T. rex still refused to answer the call. Alan, observing this, surmised that it was because she wanted to hunt her prey rather than have it offered to her.

    Later that night, a tropical storm forced the tour to be turned around sometime after the group visited the Triceratops Paddock. During this time Dennis Nedry shut down all electricity to the park, causing the Ford Explorer Tour Vehicles to shut down in front of the T. rex's paddock with its electrified fencing in the same state. At this point, the T. rex revealed herself to the visitors by eating the goat left by the fence as bait, hunger probably having eclipsing her pride, and then touching the electric fence to see if her enclosure was still electrified. Gennaro, seeing that the fence was disabled left his Explorer and ran to the nearby restroom hut to hide. By that point, the T. rex moved to the disabled fence and ripped it apart with her teeth before stepping out onto the road and roaring triumphantly. After exploring and investigating the Explorers, her attention was caught by the light that was emitted from a flashlight that Lex had turned on in the front Explorer. Unaware that the source of the light was inside the Explorer, she walked right to the front door and peered out into the jungle in front of the Explorer. It was not until Tim slammed the open door next to the T. rex shut that she discovered the source of the light.

    Now confident that the light was coming from inside the Explorer and that there were interesting objects inside, the T. rex set to attacking the mysterious vehicle in front of her, searching for a way to get at Lex and Tim to eat them. After failing to get at them through the Explorer's skylight, she flipped the car over and proceeded to savage the undercarriage and right rear tire whilst crushing it under her massive foot. Thanks to the heroic efforts of Alan and Ian, the T. rex was briefly distracted. She followed Ian as he fled toward the Tyrannosaur Paddock Bathroom, where she injured the mathematician by flinging him into the air just as her head came crashing through the door, causing Ian to be buried in the wreckage as the shelter collapsed. The destruction of the building revealed the cowering Gennaro, whom she proceeded to devour while Alan rescued the kids inside the car. Before long, however, the T. rex returned and pushed the vehicle over the cliff while Tim was still inside and pushing Lex and Alan off the edge with the car, though the three survived.

    As Robert Muldoon and Ellie were in the Tyrannosaur Paddock investigating the whereabouts of the survivors and had found Ian, the T. rex attacked the search party. Muldoon and Ellie had heard the T. rex roar several times before during the search and just before her ambush, Ian heard her footsteps. The T. rex attacked suddenly, without warning, crashing through a line of trees where she began chasing them through a tree lined corridor. After a very close chase, she was unsuccessful in catching them and so finally gave up, letting the trio escape to the Visitor Center.

    The next day, during Alan, Tim, and Lex's continued trek to the Visitor Center, they found themselves in the Gallimimus Enclosure, where they witnessed a stampeding herd of Gallimimus. They ran alongside the dinosaurs momentarily before hiding behind a fallen log and watched as the herd was suddenly ambushed by the T. rex who came roaring out of the bushes in their path, stumbling a Gallimimus. This Gallimimus tried to run away, but was too slow to react, and the Tyrannosaur lunged at it, catching the dinosaur in her jaws before proceeding to shake the Gallimimus to death. Alan, Lex, and Tim watched in amazement as the T. rex started to feast on the carcass. Lex begged Alan for them to go, to which Alan obliged. However, Tim continued to stare in fascination and so had to be forcibly taken away by Alan. She never fully consumed this Gallimimus and its remains were still present in the location where it had died by October 6, 2002, almost a decade later.

    The T. rex later made her way to the Visitor Center, entering the lobby through the uncompleted side and grabbed a Velociraptor from mid-air just as it was to pounce on Alan, Ellie, Tim, and Lex, then crushed it in her jaws. Using the distraction that she provided, the humans fled. Meanwhile, another raptor, the Big One pounced on the larger theropod. She snapped at her but could not reach her as the raptor continued to rip and tear madly. Rolling her head, the Big One fell into the T. rex's mouth where she was killed and then thrown against the Tyrannosaurus skeleton, bringing it down with a crash. Having conquered her prey, the T. rex let out a mighty bellow in triumph as the "When Dinosaurs Ruled the Earth" banner fell to the ground.

    **The Lost World: Jurassic Park**

    Like in the novel, there is a male and female Tyrannosaurus along with an infant in The Lost World. The male Tyrannosaurus is 18 feet tall and 40 feet long, the female is 19.5 feet tall and 43 feet long and the infant is 3 feet tall and 6 feet long. Roland tries to lure the male T-Rex out by trapping its infant. Sarah and Nick come across the injured infant and take it back to the trailer. Upon hearing its screams for help, both Tyrannosaurus turn up at the trailer. The group gives the infant back to its parents and both Tyrannosaurus try to push the trailer off the cliff. They disappear and Eddie saves Ian, Nick and Sarah but the two Tyrannosaurus return and kill Eddie.

    Later, the male Tyrannosaurus tracks Sarah to Roland’s camp due to the infant’s blood on her jacket. Everybody runs for their lives and a few manage to hide behind a waterfall. Several members of Roland’s team are trampled to death. Roland manages to tranquilize the creature and it’s transported to San Diego via the ship S.S. Venture. Somehow, the T-Rex breaks free and kills the entire crew. When the ship crashes into the dock in San Diego, Ludlow order the cargo hold be opened which free the creature. The Tyrannosaurus rampages through the city looking for food and water, finding a swimming pool and a dog in the process. It causes lots of damage in the city and kills a number of people.

    Dr. Ian Malcolm and Sarah Harding steal the infant from a facility, which had been brought to San Diego separately. They use the infant to lure the Tyrannosaurus back to the ship and trap it in the cargo hold, just before tranquilizing it. The the creature is then transported back to Isla Sorna under heavy guard. It is shown together with the female Tyrannosaur and the infant.

    **Jurassic Park III**

    A young adult Tyrannosaurus appears in Jurassic Park 3. According to the official size charts, it is 37 feet long and 14.5 feet tall. When Alan Grant and the other survivors escape the Spinosaurus, they encounter the creature who is just feeding on another dinosaur. The group runs back towards the Spinosaurus and a huge battle occurs between the Tyrannosaurus and the Spinosaurus. The Spinosaurus kills the T-Rex by snapping its neck in its powerful jaws.

    **Jurassic World**

    The T-rex mainly stayed in her paddock for most of the incident until Claire Dearing told Lowery Cruthers to open her enclosure's door and let her out after Claire's nephew Gray Mitchell told her that another dinosaur was needed to help kill the Indominus rex. Using a flare, Claire guided the T. rex to the Indominus and threw the flare at the hybrid. Crashing through Main Street's mounted Spinosaurus skeleton, the Tyrannosaurus challenged the I-rex with an almighty bellow, not knowing exactly what this new creature was but identifying it as a threat. When the hybrid did not back down, the T-rex attacked her viciously.

    Initially, the Tyrannosaurus had the advantage, landing several bites to the I. rex's neck, but the elder dinosaur was fighting from a territorial standpoint whilst the hybrid was aiming to kill and the tables were quickly turned, with the T-rex thrown down against the Jurassic Traders Outpost, destroying it in the process and almost killing Owen Grady, Gray, and Zach Mitchell.

    However, before the Indominus could kill her, Blue, the surviving Velociraptor of the battle, intervened by lunging onto the I. rex, giving the T. rex time to get up off the ground, now fighting to kill. With Blue latched onto the hybrid, the old T. rex grabbed the Indominus dragging her and slamming her body into the nearby buildings of Main Street. At one point, Blue rode on the tyrannosaur's back while she smashed the I. rex into one of the buildings. She finally flung the hybrid near the edge of the Jurassic World Lagoon where the Mosasaurus that resided there leaped out of the water to snatch the I-rex and drag it underwater, drowning the hybrid. After the fight, the T. rex and Blue looked at each other for a brief moment. Despite a previous animosity and hostile encounter with raptors, the T-rex decided to spare Blue either because she is too injured and exhausted, or because she doesn't see her as a threat. Either way, the old Tyrannosaurus limps away to recover from the injuries she sustained from the fight.

    In the aftermath of the incident, the T-rex stomped onto the Control Center helipad and took in the ruined park that had become void of any people, warming her wounds in the rising sun before letting out her signature roar, claiming the island as hers once again.

    **Jurassic World: Fallen Kingdom**

    6 months after the incident at Jurassic World, the T. rex continued to run wild on the island with other surviving dinosaurs. One stormy night, a group of mercenaries was on Isla Nublar to retrieve a bone sample from the I. rex's remains at the bottom of the park's lagoon, which also still housed its surviving Mosasaurus. As they prepared to pick up one of their men, the T. rex entered their campsite located in the ruins of Main Street and proceeded to chase him, stepping on the tablet that controlled the gate which connected the lagoon to the ocean in the process. The T. rex chased the man towards the edge of the lagoon, but he got away by climbing onto the helicopter's ladder. Despite grabbing the ladder with her jaws and using her strength to pull her potential prey to her, the mercenaries got away, and the T. rex was left roaring into the night. The tablet that she stepped on prevented the doors of the lagoon from closing completely, allowing the Mosasaurus to escape into the open ocean.[4]

    During the destruction of the island by the eruption of Mount Sibo, Owen and his group encountered her again, after she had inadvertently saved them from an attacking Carnotaurus, fatally subduing the meat-eating bull. She later left the dead Carnotaurus behind as the volcano erupted, with the shockwave from the eruption prompting her to flee the scene, followed by the other dinosaurs that caused a stampede. After Owen helped Claire and Franklin escape their sinking Gyrosphere and reached the shore, they spotted a helicopter carrying her thanks to the efforts of another team of mercenaries led by Ken Wheatley, proving that Eli Mills' claim of saving the dinosaurs was partially true. She and the other dinosaurs were loaded them on to their cargo ship, the Arcadia, and took them to the Lockwood Manor as Isla Nublar burned.[4]

    Sometime later on, Owen and Claire found her sedated in a truck, where they needed to get some of her blood for transfusion for Blue, who had been shot awhile back by one of Wheatley's mercenaries. As they got some of her blood, Claire rode on the theropod’s back while trying to hand the blood bag to Owen. After being locked in by one of the mercenaries, Owen looked into the tyrannosaur's eye as she awoke from her sedation. Finding herself in an enclosed space with people around her, the mighty theropod started to freak out and broke free of her restraints, with Owen being forced to jump through her snapping jaws to get out of the truck.

    Later, the T. rex was lured to her cell located beneath the Lockwood estate with a goat in order have her prepared to be sold off to wealthy buyers in an auction set up by Eli Mills and Gunnar Eversol. However, some poisonous gas was released into the holding cell during Blue's brawl with some mercenaries, threatening to kill the dinosaurs yet again. The T. rex was eventually freed along with the other dinosaurs through Claire opening all the cell doors and Maisie, who had just lost her grandfather and learned of her true origin, opening the gate that set them all free and allowing the T.rex to escape the manor. Before she left the premises, however, the T. rex caught and ate Mills after, scaring off a lone Carnotaurus that had tried to join the feast. Finishing off what little remained of Mills, the T. rex then brought one of her massive feet down on the I. rex's only surviving bone fragment and DNA sample as she stomped off into the woods, crushing it to smithereens and with it any chance of other hybrids like her returning. After she escaped, the T. rex broke into a nearby zoo and roared at an male lion, who stood his ground by angrily roaring back at her
    """

    static let tRexJPark: String = """
    When the inspection team constituting of vertebrate paleontologist Dr. Alan Grant, paleobotanist Dr. Ellie Sattler, chaotician Dr. Ian Malcolm, lawyer Donald Gennaro, and John Hammond's grandchildren Lex and Tim Murphy took a tour of Jurassic Park, initially the Tyrannosaurus was a no-show. Although computer technician Ray Arnold attempted to lure her to her paddock fence by tantalizing her with a goat, the T. rex still refused to answer the call. Alan, observing this, surmised that it was because she wanted to hunt her prey rather than have it offered to her.

    Later that night, a tropical storm forced the tour to be turned around sometime after the group visited the Triceratops Paddock. During this time Dennis Nedry shut down all electricity to the park, causing the Ford Explorer Tour Vehicles to shut down in front of the T. rex's paddock with its electrified fencing in the same state. At this point, the T. rex revealed herself to the visitors by eating the goat left by the fence as bait, hunger probably having eclipsing her pride, and then touching the electric fence to see if her enclosure was still electrified. Gennaro, seeing that the fence was disabled left his Explorer and ran to the nearby restroom hut to hide. By that point, the T. rex moved to the disabled fence and ripped it apart with her teeth before stepping out onto the road and roaring triumphantly. After exploring and investigating the Explorers, her attention was caught by the light that was emitted from a flashlight that Lex had turned on in the front Explorer. Unaware that the source of the light was inside the Explorer, she walked right to the front door and peered out into the jungle in front of the Explorer. It was not until Tim slammed the open door next to the T. rex shut that she discovered the source of the light.

    Now confident that the light was coming from inside the Explorer and that there were interesting objects inside, the T. rex set to attacking the mysterious vehicle in front of her, searching for a way to get at Lex and Tim to eat them. After failing to get at them through the Explorer's skylight, she flipped the car over and proceeded to savage the undercarriage and right rear tire whilst crushing it under her massive foot. Thanks to the heroic efforts of Alan and Ian, the T. rex was briefly distracted. She followed Ian as he fled toward the Tyrannosaur Paddock Bathroom, where she injured the mathematician by flinging him into the air just as her head came crashing through the door, causing Ian to be buried in the wreckage as the shelter collapsed. The destruction of the building revealed the cowering Gennaro, whom she proceeded to devour while Alan rescued the kids inside the car. Before long, however, the T. rex returned and pushed the vehicle over the cliff while Tim was still inside and pushing Lex and Alan off the edge with the car, though the three survived.

    As Robert Muldoon and Ellie were in the Tyrannosaur Paddock investigating the whereabouts of the survivors and had found Ian, the T. rex attacked the search party. Muldoon and Ellie had heard the T. rex roar several times before during the search and just before her ambush, Ian heard her footsteps. The T. rex attacked suddenly, without warning, crashing through a line of trees where she began chasing them through a tree lined corridor. After a very close chase, she was unsuccessful in catching them and so finally gave up, letting the trio escape to the Visitor Center.

    The next day, during Alan, Tim, and Lex's continued trek to the Visitor Center, they found themselves in the Gallimimus Enclosure, where they witnessed a stampeding herd of Gallimimus. They ran alongside the dinosaurs momentarily before hiding behind a fallen log and watched as the herd was suddenly ambushed by the T. rex who came roaring out of the bushes in their path, stumbling a Gallimimus. This Gallimimus tried to run away, but was too slow to react, and the Tyrannosaur lunged at it, catching the dinosaur in her jaws before proceeding to shake the Gallimimus to death. Alan, Lex, and Tim watched in amazement as the T. rex started to feast on the carcass. Lex begged Alan for them to go, to which Alan obliged. However, Tim continued to stare in fascination and so had to be forcibly taken away by Alan. She never fully consumed this Gallimimus and its remains were still present in the location where it had died by October 6, 2002, almost a decade later.

    The T. rex later made her way to the Visitor Center, entering the lobby through the uncompleted side and grabbed a Velociraptor from mid-air just as it was to pounce on Alan, Ellie, Tim, and Lex, then crushed it in her jaws. Using the distraction that she provided, the humans fled. Meanwhile, another raptor, the Big One pounced on the larger theropod. She snapped at her but could not reach her as the raptor continued to rip and tear madly. Rolling her head, the Big One fell into the T. rex's mouth where she was killed and then thrown against the Tyrannosaurus skeleton, bringing it down with a crash. Having conquered her prey, the T. rex let out a mighty bellow in triumph as the "When Dinosaurs Ruled the Earth" banner fell to the ground.
    """

    static let tRexLostWorld: String = """
    Like in the novel, there is a male and female Tyrannosaurus along with an infant in The Lost World. The male Tyrannosaurus is 18 feet tall and 40 feet long, the female is 19.5 feet tall and 43 feet long and the infant is 3 feet tall and 6 feet long. Roland tries to lure the male T-Rex out by trapping its infant. Sarah and Nick come across the injured infant and take it back to the trailer. Upon hearing its screams for help, both Tyrannosaurus turn up at the trailer. The group gives the infant back to its parents and both Tyrannosaurus try to push the trailer off the cliff. They disappear and Eddie saves Ian, Nick and Sarah but the two Tyrannosaurus return and kill Eddie.

    Later, the male Tyrannosaurus tracks Sarah to Roland’s camp due to the infant’s blood on her jacket. Everybody runs for their lives and a few manage to hide behind a waterfall. Several members of Roland’s team are trampled to death. Roland manages to tranquilize the creature and it’s transported to San Diego via the ship S.S. Venture. Somehow, the T-Rex breaks free and kills the entire crew. When the ship crashes into the dock in San Diego, Ludlow order the cargo hold be opened which free the creature. The Tyrannosaurus rampages through the city looking for food and water, finding a swimming pool and a dog in the process. It causes lots of damage in the city and kills a number of people.

    Dr. Ian Malcolm and Sarah Harding steal the infant from a facility, which had been brought to San Diego separately. They use the infant to lure the Tyrannosaurus back to the ship and trap it in the cargo hold, just before tranquilizing it. The the creature is then transported back to Isla Sorna under heavy guard. It is shown together with the female Tyrannosaur and the infant.
    """

    static let tRexJPark3: String = """
    A young adult Tyrannosaurus appears in Jurassic Park 3. According to the official size charts, it is 37 feet long and 14.5 feet tall. When Alan Grant and the other survivors escape the Spinosaurus, they encounter the creature who is just feeding on another dinosaur. The group runs back towards the Spinosaurus and a huge battle occurs between the Tyrannosaurus and the Spinosaurus. The Spinosaurus kills the T-Rex by snapping its neck in its powerful jaws.
    """

    static let tRexJWorld: String = """
    The T-rex mainly stayed in her paddock for most of the incident until Claire Dearing told Lowery Cruthers to open her enclosure's door and let her out after Claire's nephew Gray Mitchell told her that another dinosaur was needed to help kill the Indominus rex. Using a flare, Claire guided the T. rex to the Indominus and threw the flare at the hybrid. Crashing through Main Street's mounted Spinosaurus skeleton, the Tyrannosaurus challenged the I-rex with an almighty bellow, not knowing exactly what this new creature was but identifying it as a threat. When the hybrid did not back down, the T-rex attacked her viciously.

    Initially, the Tyrannosaurus had the advantage, landing several bites to the I. rex's neck, but the elder dinosaur was fighting from a territorial standpoint whilst the hybrid was aiming to kill and the tables were quickly turned, with the T-rex thrown down against the Jurassic Traders Outpost, destroying it in the process and almost killing Owen Grady, Gray, and Zach Mitchell.

    However, before the Indominus could kill her, Blue, the surviving Velociraptor of the battle, intervened by lunging onto the I. rex, giving the T. rex time to get up off the ground, now fighting to kill. With Blue latched onto the hybrid, the old T. rex grabbed the Indominus dragging her and slamming her body into the nearby buildings of Main Street. At one point, Blue rode on the tyrannosaur's back while she smashed the I. rex into one of the buildings. She finally flung the hybrid near the edge of the Jurassic World Lagoon where the Mosasaurus that resided there leaped out of the water to snatch the I-rex and drag it underwater, drowning the hybrid. After the fight, the T. rex and Blue looked at each other for a brief moment. Despite a previous animosity and hostile encounter with raptors, the T-rex decided to spare Blue either because she is too injured and exhausted, or because she doesn't see her as a threat. Either way, the old Tyrannosaurus limps away to recover from the injuries she sustained from the fight.

    In the aftermath of the incident, the T-rex stomped onto the Control Center helipad and took in the ruined park that had become void of any people, warming her wounds in the rising sun before letting out her signature roar, claiming the island as hers once again.
    """

    static let tRexFallenKingdom: String = """
    6 months after the incident at Jurassic World, the T. rex continued to run wild on the island with other surviving dinosaurs. One stormy night, a group of mercenaries was on Isla Nublar to retrieve a bone sample from the I. rex's remains at the bottom of the park's lagoon, which also still housed its surviving Mosasaurus. As they prepared to pick up one of their men, the T. rex entered their campsite located in the ruins of Main Street and proceeded to chase him, stepping on the tablet that controlled the gate which connected the lagoon to the ocean in the process. The T. rex chased the man towards the edge of the lagoon, but he got away by climbing onto the helicopter's ladder. Despite grabbing the ladder with her jaws and using her strength to pull her potential prey to her, the mercenaries got away, and the T. rex was left roaring into the night. The tablet that she stepped on prevented the doors of the lagoon from closing completely, allowing the Mosasaurus to escape into the open ocean.[4]

    During the destruction of the island by the eruption of Mount Sibo, Owen and his group encountered her again, after she had inadvertently saved them from an attacking Carnotaurus, fatally subduing the meat-eating bull. She later left the dead Carnotaurus behind as the volcano erupted, with the shockwave from the eruption prompting her to flee the scene, followed by the other dinosaurs that caused a stampede. After Owen helped Claire and Franklin escape their sinking Gyrosphere and reached the shore, they spotted a helicopter carrying her thanks to the efforts of another team of mercenaries led by Ken Wheatley, proving that Eli Mills' claim of saving the dinosaurs was partially true. She and the other dinosaurs were loaded them on to their cargo ship, the Arcadia, and took them to the Lockwood Manor as Isla Nublar burned.[4]

    Sometime later on, Owen and Claire found her sedated in a truck, where they needed to get some of her blood for transfusion for Blue, who had been shot awhile back by one of Wheatley's mercenaries. As they got some of her blood, Claire rode on the theropod’s back while trying to hand the blood bag to Owen. After being locked in by one of the mercenaries, Owen looked into the tyrannosaur's eye as she awoke from her sedation. Finding herself in an enclosed space with people around her, the mighty theropod started to freak out and broke free of her restraints, with Owen being forced to jump through her snapping jaws to get out of the truck.

    Later, the T. rex was lured to her cell located beneath the Lockwood estate with a goat in order have her prepared to be sold off to wealthy buyers in an auction set up by Eli Mills and Gunnar Eversol. However, some poisonous gas was released into the holding cell during Blue's brawl with some mercenaries, threatening to kill the dinosaurs yet again. The T. rex was eventually freed along with the other dinosaurs through Claire opening all the cell doors and Maisie, who had just lost her grandfather and learned of her true origin, opening the gate that set them all free and allowing the T.rex to escape the manor. Before she left the premises, however, the T. rex caught and ate Mills after, scaring off a lone Carnotaurus that had tried to join the feast. Finishing off what little remained of Mills, the T. rex then brought one of her massive feet down on the I. rex's only surviving bone fragment and DNA sample as she stomped off into the woods, crushing it to smithereens and with it any chance of other hybrids like her returning. After she escaped, the T. rex broke into a nearby zoo and roared at an male lion, who stood his ground by angrily roaring back at her
    """

    // MARK: - Complete
    static let stegosaurusSceneDescription = """
    **The Lost World: Jurassic Park**

    *Stegosaurus Skirmish*

    In 1997, the Gatherers encountered a small Stegosaurus herd near a river bed; a pair bond, a subadult, and an infant. Dr. Sarah Harding, who had arrived on Isla Sorna before the rest of her team did, was taking photographs of this herd when the other Gatherers found her. She approached the herd very closely and encountered an infant, Claire[9], and took pictures of her. But the film of her camera was full and it began to make noises. Because of the noise, the herd saw Sarah as a threat to their young and started to attack Sarah. She retaliated by hiding in a log nearby, as a male of the herd pursued her and hit the log with his thagomizer.

    The herd quickly left soon afterward.

    *Isla Sorna Incident (1997)*

    Later, Peter Ludlow's hunters captured both an infant and an adult Stegosaurus. It is unknown if the baby Stegosaurus is Claire or an entirely different infant. These stegosaurs were later freed by Gathers Nick Van Owen and Dr. Sarah Harding.

    In the aftermath, another herd was present that contained another juvenile that might have also been Claire after the Tyrannosaur Buck and Junior had been returned to the island after the San Diego Incident.


    **Jurassic Park III**

    Stegosaurs were briefly encountered twice by Dr. Alan Grant and the Kirby family when they flew over Sorna and when they traveled through one of the rivers of Isla Sorna on the Isla Sorna Aviary's barge where the Stegosaurus lined the riversides.

    **Jurassic World**

    Masrani Global Corporation created a new dinosaur zoo on Isla Nublar: Jurassic World. These new clones had a dark tan skin with light olive green. Their plates were black with a brown horizontal stripe. The size is far more accurate compared to the InGen clones. These new clones have inaccurate drooping tail most of the time, as well as less pronounced beaks blended into the skin, although the individuals in Camp Cretaceous actually have beaks, and the striped individuals that resides in Camp Cretaceous were the males. The new cloned Stegosaurus lived in the Cretaceous Cruise, the Gentle Giants Petting Zoo and the Gyrosphere Valley.

    A heard of Stegosaurs can be seen by a river in the Jurassic World trailer.



    **Jurassic World: Fallen Kingdom**

    The Stegosaurus first appear during a stampede with other dinosaurs as they run away from Mt. Sibo during its eruption, bumping into Owen’s party in the process.

    Several Stegosaurus were successfully captured by Ken Wheatley and his group of mercenaries to be loaded on to Arcadia to be taken to the mainland. One individual is about to be loaded onto the ship until Wheatley ordered the truck carrying it to stop for a while. Wheatley soothes the tranquilized dinosaur's head for a bit before brandishing his pliers to pull one of its teeth out. He taunted the Stegosaurus by showing it its own tooth before placing it among his collection of other dinosaur teeth he had extracted and kept as trophies.

    When the ship Arcadia left Isla Nublar, one seemingly distressed adult Stegosaurus could be seen calling out from its cage.

    The captured Stegosaurus were locked and cages for auction, with one being successfully sold. They were once again threatened by death due to some poisonous gas. Luckily, they were released from their cages by Claire Dearing and were able to escape thanks to Maisie Lockwood. They were last seen escaping the Lockwood Manor along with many other dinosaurs and fleeing into the forests of Northern California.
    """

    static let stegLostWorld: String = """
    *Stegosaurus Skirmish*

    In 1997, the Gatherers encountered a small Stegosaurus herd near a river bed; a pair bond, a subadult, and an infant. Dr. Sarah Harding, who had arrived on Isla Sorna before the rest of her team did, was taking photographs of this herd when the other Gatherers found her. She approached the herd very closely and encountered an infant, Claire[9], and took pictures of her. But the film of her camera was full and it began to make noises. Because of the noise, the herd saw Sarah as a threat to their young and started to attack Sarah. She retaliated by hiding in a log nearby, as a male of the herd pursued her and hit the log with his thagomizer.

    The herd quickly left soon afterward.

    *Isla Sorna Incident (1997)*

    Later, Peter Ludlow's hunters captured both an infant and an adult Stegosaurus. It is unknown if the baby Stegosaurus is Claire or an entirely different infant. These stegosaurs were later freed by Gathers Nick Van Owen and Dr. Sarah Harding.

    In the aftermath, another herd was present that contained another juvenile that might have also been Claire after the Tyrannosaur Buck and Junior had been returned to the island after the San Diego Incident.
    """

    static let stegJPark3: String = """
    Stegosaurs were briefly encountered twice by Dr. Alan Grant and the Kirby family when they flew over Sorna and when they traveled through one of the rivers of Isla Sorna on the Isla Sorna Aviary's barge where the Stegosaurus lined the riversides.
    """

    static let stegJWorld: String = """
    A heard of Stegosaurs can be seen by a river in the Jurassic World trailer.
    """

    static let stegFallenKingdom: String = """
    The Stegosaurus first appear during a stampede with other dinosaurs as they run away from Mt. Sibo during its eruption, bumping into Owen’s party in the process.

    Several Stegosaurus were successfully captured by Ken Wheatley and his group of mercenaries to be loaded on to Arcadia to be taken to the mainland. One individual is about to be loaded onto the ship until Wheatley ordered the truck carrying it to stop for a while. Wheatley soothes the tranquilized dinosaur's head for a bit before brandishing his pliers to pull one of its teeth out. He taunted the Stegosaurus by showing it its own tooth before placing it among his collection of other dinosaur teeth he had extracted and kept as trophies.

    When the ship Arcadia left Isla Nublar, one seemingly distressed adult Stegosaurus could be seen calling out from its cage.

    The captured Stegosaurus were locked and cages for auction, with one being successfully sold. They were once again threatened by death due to some poisonous gas. Luckily, they were released from their cages by Claire Dearing and were able to escape thanks to Maisie Lockwood. They were last seen escaping the Lockwood Manor along with many other dinosaurs and fleeing into the forests of Northern California.
    """

    // MARK: - Complete
    static let spinosaurusSceneDescriptions = """
    **Jurassic Park III**

    *Isla Sorna incident of 2001*

    During his time lost on Isla Sorna Eric Kirby learned that though Tyrannosaurus rex urine can scare off small dinosaurs like Compsognathus, it can also attract Spinosaurus, which reinforces the territoriality of Spinosaurus in relation to Tyrannosaurus.

    Amanda Kirby, Eric's mother, apparently attracted a Spinosaurus that would follow her and her group throughout the incident by shouting her missing son's name through a megaphone. Cooper, one of the mercenaries hired by the Kirby family, spotted the large dinosaur and began to fire his rifle at it as his fellow mercenaries, Udesky and M.B. Nash, fled the area. The attack failed to stop the Spinosaurus and the dinosaur injured its attacker's arm. This caused Cooper's group to desperately attempt to leave the island in their plane.

    Cooper ran in front of the plane as it taxied down the airstrip, and tried to convince Nash to stop the plane. The Spinosaurus quickly emerged to the right of the wounded mercenary and proceeded to devour him just as the plane prepared to lift off. The airplane collided with the Spinosaurus's flank just seconds after it takes the life of its first victim. The collision dealt nothing more than a minor injury to the large theropod, though the plane crashed into a tree in the surrounding jungle.

    The Spinosaurus soon quickly found the rest of Cooper's group inside the damaged airplane, removed the cockpit and grabbed Nash's leg with its strong jaws. Nash desperately fought against the Spinosaurus grip by grabbing Amanda Kirby's legs but despite his and Udesky's efforts, he was swiftly pulled out of the plane and killed as he tried to crawl away. The Spinosaurus gave out a loud roar that shook the plane violently until it fell out of the tree and onto the ground below. With the passengers now under its feet, the Spinosaurus continued its rampage. The Spinosaurus then proceeded to roll the already damaged airplane towards itself, flatten it with its foot and rammed its head into the remaining portion, searching for the humans inside. Dr. Alan Grant and his team fled from the wreckage the Spinosaurus was scavenging, hoping it would lose sight of them. The Spinosaurus was quick to follow and began to chase them throughout the jungle only to be stopped by a patch of trees that temporarily blocked it from continuing its pursuit. The Spinosaurus managed to make its way around the blockage and met up with its prey soon afterward fleeing from the Tyrannosaurus.

    A conflict ensued as soon as the Spinosaurus and the Tyrannosaurus rex saw one another. The Tyrannosaurus was the first to strike, he clamped down on the Spinosaurus' neck using his strong jaws, pinning it to the ground. Nonetheless, the Spinosaurus briskly got back on its feet and broke free of the Tyrannosaurus grip, taking the chance to try and bite its opponent's flanks, with the T. rex doing the same as well. The T. rex then decided to charge headfirst into the Spinosaurus, pushing it forward, though this left him vulnerable to its next strike. The Spinosaurus bit down on the Tyrannosaurus neck, proceeded to grab it with its powerful forearms and snapped it, killing the Tyrannosaurus rex. The Spinosaurus roared triumphantly as it claimed the carcass of its recent kill. The battle allowed the human visitors to finally escape from the vicious Spinosaurus, but they would encounter the giant theropod several times throughout the incident.

    When the Spinosaurus consumed the mercenaries, their clothes and gear were undigested. The most notable of the objects was Paul Kirby's satellite phone that he gave to Nash that would ring inside its stomach. Eric Kirby, who had just met Alan Grant, heard this ringing of his father's satellite phone and assumed his family was in the area. Though he and Dr. Alan Grant did indeed reunite with his family on the opposite sides of the Isla Sorna Aviary observatory's large perimeter fence, they all were soon aware of the Spinosaurus's presence behind them after they realized that Paul lacked his phone.

    As soon as the recently reunited group saw the Spinosaurus it began to chase Eric and Alan, but the two reached the other side of the fence by crawling through a hole that was in it. For a brief moment, the predator seemed to have been detoured, unable to get past the fence, until the Spinosaurus smashed through the perimeter fence. With their only means of defense against the Spinosaurus penetrated, Dr. Alan Grant, the Kirby family, and his colleague Billy Brennan fled towards the Isla Sorna Field Lab. Once inside, Paul Kirby and Alan Grant barricaded the doors right before the Spinosaurus could get inside. Unlike the fence that surrounded the laboratory, the doors successfully prevented the Spinosaurus from penetrating them. Uninterested, the dinosaur soon left.

    The group later reacquired the satellite phone from scavenging through the Spinosaurus's dung that contained the remains of Nash and Cooper. The smell of the large predator's dung discouraged a Ceratosaurus from potentially attacking them.

    The Spinosaurus made one last attempt at killing the humans before the incident ended by stalking their boat they used to escape from the Isla Sorna Aviary from its inhabitants during a thunderstorm that began at night. It swam silently, hidden beneath the deep waters of the river that were rising as the rain from the storm fell, the only indication of its presence being the native Bonitos swimming away in fear of it and the tip of its sail emerging from the water. The Spinosaurus began its attack by ramming into the back of the boat, emerged from the water, and proceeded to severely damage the boat's center console and the fuel tank, causing it to leak rapidly.

    The Kirby family and Alan Grant locked themselves in a large cage on the watercraft for protection from the rampage of the Spinosaurus. However, their attempt was rendered futile when the Spinosaurus pulled the cage into the water, nearly drowning the people inside as it became submerged. While the Spinosaurus thrashed in the water searching for them, the entrapment landed on some rocks, allowing the top portion of the enclosure to surface and giving the trapped humans the oxygen they needed, though the dinosaur quickly used this to its advantage. It put its arm in the cage and grabbed Amanda Kirby, preparing to kill her. Her husband, Paul, who swam out of the cage once it submerged, successfully distracted the predator by shouting from a half-submerged crane he had just climbed. This, in turn, allowed the others to escape the cage.

    With Paul Kirby gaining its full attention, the Spinosaurus responded to his calls by giving the crane two nudges with its head, causing Paul Kirby to almost fall into the raging river below, dangling with nothing else to hold on to. Afterward, Dr. Alan Grant found the boat's flare gun in the riverbed near the entrapment and shot the Spinosaurus with it. The flare did nothing of harm to its target but once it fell into the water it ignited the petroleum that had leaked out of the boat and into the river. Afraid of the fire surrounding it, the Spinosaurus fled the area as the crane collapsed around it, ending its involvement in the Isla Sorna Incident of 2001.
    """

    static let spinosaurusJPark3: String = """
    During his time lost on Isla Sorna Eric Kirby learned that though Tyrannosaurus rex urine can scare off small dinosaurs like Compsognathus, it can also attract Spinosaurus, which reinforces the territoriality of Spinosaurus in relation to Tyrannosaurus.

    Amanda Kirby, Eric's mother, apparently attracted a Spinosaurus that would follow her and her group throughout the incident by shouting her missing son's name through a megaphone. Cooper, one of the mercenaries hired by the Kirby family, spotted the large dinosaur and began to fire his rifle at it as his fellow mercenaries, Udesky and M.B. Nash, fled the area. The attack failed to stop the Spinosaurus and the dinosaur injured its attacker's arm. This caused Cooper's group to desperately attempt to leave the island in their plane.

    Cooper ran in front of the plane as it taxied down the airstrip, and tried to convince Nash to stop the plane. The Spinosaurus quickly emerged to the right of the wounded mercenary and proceeded to devour him just as the plane prepared to lift off. The airplane collided with the Spinosaurus's flank just seconds after it takes the life of its first victim. The collision dealt nothing more than a minor injury to the large theropod, though the plane crashed into a tree in the surrounding jungle.

    The Spinosaurus soon quickly found the rest of Cooper's group inside the damaged airplane, removed the cockpit and grabbed Nash's leg with its strong jaws. Nash desperately fought against the Spinosaurus grip by grabbing Amanda Kirby's legs but despite his and Udesky's efforts, he was swiftly pulled out of the plane and killed as he tried to crawl away. The Spinosaurus gave out a loud roar that shook the plane violently until it fell out of the tree and onto the ground below. With the passengers now under its feet, the Spinosaurus continued its rampage. The Spinosaurus then proceeded to roll the already damaged airplane towards itself, flatten it with its foot and rammed its head into the remaining portion, searching for the humans inside. Dr. Alan Grant and his team fled from the wreckage the Spinosaurus was scavenging, hoping it would lose sight of them. The Spinosaurus was quick to follow and began to chase them throughout the jungle only to be stopped by a patch of trees that temporarily blocked it from continuing its pursuit. The Spinosaurus managed to make its way around the blockage and met up with its prey soon afterward fleeing from the Tyrannosaurus.

    A conflict ensued as soon as the Spinosaurus and the Tyrannosaurus rex saw one another. The Tyrannosaurus was the first to strike, he clamped down on the Spinosaurus' neck using his strong jaws, pinning it to the ground. Nonetheless, the Spinosaurus briskly got back on its feet and broke free of the Tyrannosaurus grip, taking the chance to try and bite its opponent's flanks, with the T. rex doing the same as well. The T. rex then decided to charge headfirst into the Spinosaurus, pushing it forward, though this left him vulnerable to its next strike. The Spinosaurus bit down on the Tyrannosaurus neck, proceeded to grab it with its powerful forearms and snapped it, killing the Tyrannosaurus rex. The Spinosaurus roared triumphantly as it claimed the carcass of its recent kill. The battle allowed the human visitors to finally escape from the vicious Spinosaurus, but they would encounter the giant theropod several times throughout the incident.

    When the Spinosaurus consumed the mercenaries, their clothes and gear were undigested. The most notable of the objects was Paul Kirby's satellite phone that he gave to Nash that would ring inside its stomach. Eric Kirby, who had just met Alan Grant, heard this ringing of his father's satellite phone and assumed his family was in the area. Though he and Dr. Alan Grant did indeed reunite with his family on the opposite sides of the Isla Sorna Aviary observatory's large perimeter fence, they all were soon aware of the Spinosaurus's presence behind them after they realized that Paul lacked his phone.

    As soon as the recently reunited group saw the Spinosaurus it began to chase Eric and Alan, but the two reached the other side of the fence by crawling through a hole that was in it. For a brief moment, the predator seemed to have been detoured, unable to get past the fence, until the Spinosaurus smashed through the perimeter fence. With their only means of defense against the Spinosaurus penetrated, Dr. Alan Grant, the Kirby family, and his colleague Billy Brennan fled towards the Isla Sorna Field Lab. Once inside, Paul Kirby and Alan Grant barricaded the doors right before the Spinosaurus could get inside. Unlike the fence that surrounded the laboratory, the doors successfully prevented the Spinosaurus from penetrating them. Uninterested, the dinosaur soon left.

    The group later reacquired the satellite phone from scavenging through the Spinosaurus's dung that contained the remains of Nash and Cooper. The smell of the large predator's dung discouraged a Ceratosaurus from potentially attacking them.

    The Spinosaurus made one last attempt at killing the humans before the incident ended by stalking their boat they used to escape from the Isla Sorna Aviary from its inhabitants during a thunderstorm that began at night. It swam silently, hidden beneath the deep waters of the river that were rising as the rain from the storm fell, the only indication of its presence being the native Bonitos swimming away in fear of it and the tip of its sail emerging from the water. The Spinosaurus began its attack by ramming into the back of the boat, emerged from the water, and proceeded to severely damage the boat's center console and the fuel tank, causing it to leak rapidly.

    The Kirby family and Alan Grant locked themselves in a large cage on the watercraft for protection from the rampage of the Spinosaurus. However, their attempt was rendered futile when the Spinosaurus pulled the cage into the water, nearly drowning the people inside as it became submerged. While the Spinosaurus thrashed in the water searching for them, the entrapment landed on some rocks, allowing the top portion of the enclosure to surface and giving the trapped humans the oxygen they needed, though the dinosaur quickly used this to its advantage. It put its arm in the cage and grabbed Amanda Kirby, preparing to kill her. Her husband, Paul, who swam out of the cage once it submerged, successfully distracted the predator by shouting from a half-submerged crane he had just climbed. This, in turn, allowed the others to escape the cage.

    With Paul Kirby gaining its full attention, the Spinosaurus responded to his calls by giving the crane two nudges with its head, causing Paul Kirby to almost fall into the raging river below, dangling with nothing else to hold on to. Afterward, Dr. Alan Grant found the boat's flare gun in the riverbed near the entrapment and shot the Spinosaurus with it. The flare did nothing of harm to its target but once it fell into the water it ignited the petroleum that had leaked out of the boat and into the river. Afraid of the fire surrounding it, the Spinosaurus fled the area as the crane collapsed around it, ending its involvement in the Isla Sorna Incident of 2001.
    """

    // MARK: - Complete
    static let pteranodonSceneDescriptions = """
    **The Lost World: Jurassic Park**

    Pteranodons have a cameo appearance at the very end of The Lost World. They were seen flying over a group of Stegosaurus and one of them is shown resting on a branch.

    **Jurassic Park III**

    *Isla Sorna Incident (2001)*

    The Pteranodon family living in the Isla Sorna Aviary had a major skirmish with the surviving humans involved in the incident. One of the adults detected the human visitors' presence in its enclosure as they crossed the bridge that connects the observatory to the Isla Sorna Aviary so they could get in the barge below. The adult pterosaur decided to land on the bridge when it was Eric Kirby's time to cross. Eric let out a scream of terror just before breaking into a sprint when the Pteranodon emerged from the thick fog surrounding the back of the laboratory to the front of the aviary.

    The large pterosaur responded by snatching Eric Kirby and flying off as his group were racing towards the situation. The pterosaur carried the young human to a rock platform near its nest filled with baby Pteranodons chirping out of hunger. With the hungry babies setting their sights on him, leaving Eric to quarrel with the Pteranodons.

    Eventually, the juvenile Pteranodons swarmed around him, but there was hope for Eric because Billy Brennan descended towards the nesting area to save the boy using the recovered paraglider of the now-deceased Ben Hildebrand and was calling to him. The baby Pteranodons bit tightly on Eric Kirby's jacket, focused on the appeal rather than their main target, allowing Eric to use this to his advantage by giving his jacket over to the hungry Pteranodons and leaping to a platform behind him afterward. Though as soon as he reached his destination, he found there was nowhere else to flee to, allowing the juvenile pterosaurs to continue attacking him.

    Thankfully for Eric Kirby, Billy Brennan was coming close to the stone platform he was on, wanting Eric to jump to him. Eric was eager to escape his attackers so he swiped the Pteranodons off of him and he successfully clung to Billy soon afterward. The Pteranodon juveniles ceased their pursuit as Eric Kirby drifted away with his rescuer, but there was one that continued the chase and managed to grasp itself onto Eric's back. However, the pterosaur's grip was not very firm and it soon fell off as Billy made sharp turns as he glided. Despite being rescued by Billy Brennan, the boy was not safe from danger. As the two paraglided, three adult Pteranodons followed them with one making a minor tear in their parachute. This attack made Billy demand Eric let go of him and jump safely into the water below.

    Concurrent to the events mentioned above, Dr. Alan Grant, Amanda, and Paul Kirby were racing through the aviary's walkway trying to reach Eric. But they were put to a halt when they reached a section of the walkway that was completely missing. This gave an adult Pteranodon the chance to strike them. It tried getting through the open passageway, but its large wingspan and head crest wouldn't allow it to fit through. So it decided to fly up and land on the top of one of the sections of the passageway that was slightly damaged and slide its beak through hoping to bite one of the fleeing humans. Because of its weight, the roof of the passage collapsed, getting the Pteranodon inside the walkway. As the flying reptile cornered its prey to the end of the hallway, the section they were in collapsed from the added weight of the pterosaur, plunging both the humans and the Pteranodon into the water below. The pterosaur quickly reached by emerging to prepare itself for flight, but was pushed back into the river by the falling segment it unwillingly helped detach.

    As Billy Brennan glided away from any of the airborne reptiles chasing him, his paraglider became snagged on a bulging nearby rock face. With their prey in a weak position, two Pteranodons began to circle around him like buzzards, preparing to strike. Billy freed himself by removing his harness and fell into the riverbank below, but he was not free from the sight of the Pterosaurs. Dr. Alan Grant and Paul Kirby, who had just reached dry land, reunited with Eric Kirby and watched Billy from afar, rushed to rescue him.

    Once they reached Billy's position, a Pteranodon snatched him, but it lost grip of its prey seconds after grabbing him, only for a second Pteranodon to pin him to the rock bed of the river. Though, like the previous attack, Brennan broke free from his attackers' grasp. As the pterosaurs attacked him, Billy demanded that the two group members not try saving him. After one final plea, the two pterosaurs that had pursued Billy relentlessly assaulted him at the same time and proceeded to viciously maul him as his body drifted down the river. However, Brennan somehow survived the lacerations the Pteranodons gave him and he was later rescued by the Marines at the end of the incident.

    A third Pteranodon began to chase Dr. Alan Grant and Paul Kirby as Billy was mauled. But when it tried to snatch one of the humans, they both dived into the deep waters of the river where they swam to the barge and the rest of their group. The Pteranodon followed in pursuit but was blocked by one of the metal walls of the Aviary. While the two men went to save Billy, Eric and Amanda Kirby unlocked the door to the Isla Sorna Aviary to escape it. After the two unlocked the door, Amanda soon relocked it, though unknown to her it soon reverted back when she and the other survivors rushed to get to the boat.

    The three Pteranodon adults escaped their enclosure after the humans had left. For some reason, they abandoned their young. This could have been because they didn't know how expansive the world was outside of the Aviary or thought the fourth Pteranodon would take care of the juveniles, which seems unlikely after the section of the walkway fell on it. The survivors and the Marines/Navy who had rescued them saw the three Pterosaurs as they flew away from Isla Sorna. When asked by Dr. Grant why the flying reptiles were leaving their home, Dr. Grant suggested that they were looking for new nesting grounds. The survivors hardly showed concern for the escaped pterosaurs, focusing on the joy of being rescued.

    The escaped Pteranodons traveled a long distance, reaching Canada before they were "cleaned up" by Vic Hoskins and his InGen Security Division team. How the situation was handled impressed Simon Masrani who had bought out InGen several years before and had plans to make his own dinosaur park. He decided to appoint Vic to a high position in the InGen Security Division to reinvent the security firm.

    **Jurassic World**

    Pteranodon was recreated by InGen a second time for Masrani Global Corporation's new dinosaur park Jurassic World.

    Despite their aggression, they seemed to be comfortable with living alongside the smaller Dimorphodon inside The Aviary.

    A humorous incident once occurred at Jurassic World when a Pteranodon stole a man's hat.

    *Isla Nublar Incident (2015)*

    After the hybrid Indominus rex escaped from its enclosure, it ran into the aviary while being pursued by the JW001 helicopter. A group of Pteranodons attacked the helicopter, killing the two Asset Containment Unit troopers onboard and causing it to crash into the enclosure. The ensuing explosion killed Simon Masrani, who was piloting the helicopter and allowed the residents of the aviary to escape.

    A mixed flock of Pteranodon and Dimorphodon then flew into the Main Street of the park and attacked the human visitors in the area. One Pteranodon grabbed Jurassic World employee Zara Young where she was briefly flung among other Pteranodons until she was ultimately dropped into the Jurassic World Lagoon where the Mosasaurus lived. While in the water several Pteranodons dived to retrieve her. When one of the pterosaurs finally grabbed her, the Mosasaurus inside the lagoon saw the Pteranodon flying over her territory and proceeded to consume the large pterosaur whole, killing Zara in the process, who was in the grip of the Pteranodon. Another Pteranodon nearly crushed Gray and Zach Mitchell after it was tranquilized while in flight and crashed to the ground below. The flock was eventually subdued by park rangers and Owen Grady after they entered the area with tranquilizer rifles.

    Another mixed flock was present in the Gentle Giants Petting Zoo where they also attacked the people there as well as the juvenile animals.

    After the incident, Pteranodons were seen roaming the skies freely, now having become wild.

    **Jurassic World: Fallen Kingdom**

    It is revealed that there are surviving Pteranodon populations on Isla Nublar, although they will now face an impending danger, alongside many other creatures, in the form of an erupting volcano.

    Pteranodon were first seen flying over Owen Grady as he was searching for the Velociraptor Blue. More are seen flying off the island during the Eruption of Mt. Sibo (with an individual getting knocked out of the sky by falling volcanic debris around the same time that a juvenile Allosaurus was struck down by a magma rock).

    At least three Pteranodon were captured and taken to Lockwood Manor, but they escaped along with the rest of the animals with the help of Claire Dearing and Maisie Lockwood. One individual attempted to carry off a mercenary who is then dropped onto a car, killing him. Three Pteranodon were seen flying in the ocean with Owen, Claire, and Maisie looking on from the jeep they were driving in. Three of them were later seen on the miniature Eiffel Tower in Las Vegas during the post-credits scene.
    """

    static let pteranodonLostWorld: String = """
    Pteranodons have a cameo appearance at the very end of The Lost World. They were seen flying over a group of Stegosaurus and one of them is shown resting on a branch.
    """

    static let pteranodonJPark3: String = """
    The Pteranodon family living in the Isla Sorna Aviary had a major skirmish with the surviving humans involved in the incident. One of the adults detected the human visitors' presence in its enclosure as they crossed the bridge that connects the observatory to the Isla Sorna Aviary so they could get in the barge below. The adult pterosaur decided to land on the bridge when it was Eric Kirby's time to cross. Eric let out a scream of terror just before breaking into a sprint when the Pteranodon emerged from the thick fog surrounding the back of the laboratory to the front of the aviary.

    The large pterosaur responded by snatching Eric Kirby and flying off as his group were racing towards the situation. The pterosaur carried the young human to a rock platform near its nest filled with baby Pteranodons chirping out of hunger. With the hungry babies setting their sights on him, leaving Eric to quarrel with the Pteranodons.

    Eventually, the juvenile Pteranodons swarmed around him, but there was hope for Eric because Billy Brennan descended towards the nesting area to save the boy using the recovered paraglider of the now-deceased Ben Hildebrand and was calling to him. The baby Pteranodons bit tightly on Eric Kirby's jacket, focused on the appeal rather than their main target, allowing Eric to use this to his advantage by giving his jacket over to the hungry Pteranodons and leaping to a platform behind him afterward. Though as soon as he reached his destination, he found there was nowhere else to flee to, allowing the juvenile pterosaurs to continue attacking him.

    Thankfully for Eric Kirby, Billy Brennan was coming close to the stone platform he was on, wanting Eric to jump to him. Eric was eager to escape his attackers so he swiped the Pteranodons off of him and he successfully clung to Billy soon afterward. The Pteranodon juveniles ceased their pursuit as Eric Kirby drifted away with his rescuer, but there was one that continued the chase and managed to grasp itself onto Eric's back. However, the pterosaur's grip was not very firm and it soon fell off as Billy made sharp turns as he glided. Despite being rescued by Billy Brennan, the boy was not safe from danger. As the two paraglided, three adult Pteranodons followed them with one making a minor tear in their parachute. This attack made Billy demand Eric let go of him and jump safely into the water below.

    Concurrent to the events mentioned above, Dr. Alan Grant, Amanda, and Paul Kirby were racing through the aviary's walkway trying to reach Eric. But they were put to a halt when they reached a section of the walkway that was completely missing. This gave an adult Pteranodon the chance to strike them. It tried getting through the open passageway, but its large wingspan and head crest wouldn't allow it to fit through. So it decided to fly up and land on the top of one of the sections of the passageway that was slightly damaged and slide its beak through hoping to bite one of the fleeing humans. Because of its weight, the roof of the passage collapsed, getting the Pteranodon inside the walkway. As the flying reptile cornered its prey to the end of the hallway, the section they were in collapsed from the added weight of the pterosaur, plunging both the humans and the Pteranodon into the water below. The pterosaur quickly reached by emerging to prepare itself for flight, but was pushed back into the river by the falling segment it unwillingly helped detach.

    As Billy Brennan glided away from any of the airborne reptiles chasing him, his paraglider became snagged on a bulging nearby rock face. With their prey in a weak position, two Pteranodons began to circle around him like buzzards, preparing to strike. Billy freed himself by removing his harness and fell into the riverbank below, but he was not free from the sight of the Pterosaurs. Dr. Alan Grant and Paul Kirby, who had just reached dry land, reunited with Eric Kirby and watched Billy from afar, rushed to rescue him.

    Once they reached Billy's position, a Pteranodon snatched him, but it lost grip of its prey seconds after grabbing him, only for a second Pteranodon to pin him to the rock bed of the river. Though, like the previous attack, Brennan broke free from his attackers' grasp. As the pterosaurs attacked him, Billy demanded that the two group members not try saving him. After one final plea, the two pterosaurs that had pursued Billy relentlessly assaulted him at the same time and proceeded to viciously maul him as his body drifted down the river. However, Brennan somehow survived the lacerations the Pteranodons gave him and he was later rescued by the Marines at the end of the incident.

    A third Pteranodon began to chase Dr. Alan Grant and Paul Kirby as Billy was mauled. But when it tried to snatch one of the humans, they both dived into the deep waters of the river where they swam to the barge and the rest of their group. The Pteranodon followed in pursuit but was blocked by one of the metal walls of the Aviary. While the two men went to save Billy, Eric and Amanda Kirby unlocked the door to the Isla Sorna Aviary to escape it. After the two unlocked the door, Amanda soon relocked it, though unknown to her it soon reverted back when she and the other survivors rushed to get to the boat.

    The three Pteranodon adults escaped their enclosure after the humans had left. For some reason, they abandoned their young. This could have been because they didn't know how expansive the world was outside of the Aviary or thought the fourth Pteranodon would take care of the juveniles, which seems unlikely after the section of the walkway fell on it. The survivors and the Marines/Navy who had rescued them saw the three Pterosaurs as they flew away from Isla Sorna. When asked by Dr. Grant why the flying reptiles were leaving their home, Dr. Grant suggested that they were looking for new nesting grounds. The survivors hardly showed concern for the escaped pterosaurs, focusing on the joy of being rescued.

    The escaped Pteranodons traveled a long distance, reaching Canada before they were "cleaned up" by Vic Hoskins and his InGen Security Division team. How the situation was handled impressed Simon Masrani who had bought out InGen several years before and had plans to make his own dinosaur park. He decided to appoint Vic to a high position in the InGen Security Division to reinvent the security firm.
    """

    static let pteranodonJWorld: String = """
    A humorous incident once occurred at Jurassic World when a Pteranodon stole a man's hat.

    After the hybrid Indominus rex escaped from its enclosure, it ran into the aviary while being pursued by the JW001 helicopter. A group of Pteranodons attacked the helicopter, killing the two Asset Containment Unit troopers onboard and causing it to crash into the enclosure. The ensuing explosion killed Simon Masrani, who was piloting the helicopter and allowed the residents of the aviary to escape.

    A mixed flock of Pteranodon and Dimorphodon then flew into the Main Street of the park and attacked the human visitors in the area. One Pteranodon grabbed Jurassic World employee Zara Young where she was briefly flung among other Pteranodons until she was ultimately dropped into the Jurassic World Lagoon where the Mosasaurus lived. While in the water several Pteranodons dived to retrieve her. When one of the pterosaurs finally grabbed her, the Mosasaurus inside the lagoon saw the Pteranodon flying over her territory and proceeded to consume the large pterosaur whole, killing Zara in the process, who was in the grip of the Pteranodon. Another Pteranodon nearly crushed Gray and Zach Mitchell after it was tranquilized while in flight and crashed to the ground below. The flock was eventually subdued by park rangers and Owen Grady after they entered the area with tranquilizer rifles.

    Another mixed flock was present in the Gentle Giants Petting Zoo where they also attacked the people there as well as the juvenile animals.

    After the incident, Pteranodons were seen roaming the skies freely, now having become wild.
    """

    static let pteranodonFallenKingdom: String = """
    It is revealed that there are surviving Pteranodon populations on Isla Nublar, although they will now face an impending danger, alongside many other creatures, in the form of an erupting volcano.

    Pteranodon were first seen flying over Owen Grady as he was searching for the Velociraptor Blue. More are seen flying off the island during the Eruption of Mt. Sibo (with an individual getting knocked out of the sky by falling volcanic debris around the same time that a juvenile Allosaurus was struck down by a magma rock).

    At least three Pteranodon were captured and taken to Lockwood Manor, but they escaped along with the rest of the animals with the help of Claire Dearing and Maisie Lockwood. One individual attempted to carry off a mercenary who is then dropped onto a car, killing him. Three Pteranodon were seen flying in the ocean with Owen, Claire, and Maisie looking on from the jeep they were driving in. Three of them were later seen on the miniature Eiffel Tower in Las Vegas during the post-credits scene.
    """

    // MARK: - Complete
    static let pachcephalosaurusSceneDescriptions = """
    **The Lost World: Jurassic Park**

    *Isla Sorna Incident (1997)*

    During the game trail harvest, the InGen hunting team captured a juvenile Pachycephalosaurus on the Game Trail. It was nicknamed "Friar Tuck" because their leader Roland Tembo was unable to pronounce its genus name.

    In the struggle, the creature briefly managed to escape and charged forward at a hunter taking cover behind a car door. The Pachycephalosaurus knocked one hunter aside as it went, and realizing what was about to happen, the other hunter tried to take shelter in his jeep. Unfortunately, the animal slammed into the car door before the man could pull his legs into the car, crushing his legs in the door in the process. The Pachycephalosaurus was eventually subdued and captured by the hunting team.

    This individual was later freed by Gatherers Dr. Sarah Harding and Nick Van Owen, though it is unknown if it survived.

    **Jurassic World**

    A new set of clones was created by InGen for Masrani Global Corporation's Jurassic World. The website says the new clones were close to the size of the originals, though this is incorrect. The websites' skin was dark red with lime spots and a lime underbelly. They resided in the self-titled Pachy Arena where visitors could watch them have on of their famous head-butt duels. Everytime they butt heads, their inplants became temporarily disabled, which allowed the Pachycephalosaurus to escape the Pachy Arena without being tracked.

    It is unknown as to why the website Pachycephalosaurus look very different from their original cloned counterparts,[8] as in the security camera, the Pachycephalosaurus looked very different.

    Before the 2015 Isla Nublar Incident, an adult Pachycephalosaurus broke out of the Pachy Arena but was tranquilized and returned to the paddock by some Asset Containment Unit workers.
    """

    static let pachcephalosaurusLostWorld: String = """
    During the game trail harvest, the InGen hunting team captured a juvenile Pachycephalosaurus on the Game Trail. It was nicknamed "Friar Tuck" because their leader Roland Tembo was unable to pronounce its genus name.

    In the struggle, the creature briefly managed to escape and charged forward at a hunter taking cover behind a car door. The Pachycephalosaurus knocked one hunter aside as it went, and realizing what was about to happen, the other hunter tried to take shelter in his jeep. Unfortunately, the animal slammed into the car door before the man could pull his legs into the car, crushing his legs in the door in the process. The Pachycephalosaurus was eventually subdued and captured by the hunting team.

    This individual was later freed by Gatherers Dr. Sarah Harding and Nick Van Owen, though it is unknown if it survived.
    """

    static let pachcephalosaurusJWorld: String = """
    A new set of clones was created by InGen for Masrani Global Corporation's Jurassic World. The website says the new clones were close to the size of the originals, though this is incorrect. The websites' skin was dark red with lime spots and a lime underbelly. They resided in the self-titled Pachy Arena where visitors could watch them have on of their famous head-butt duels. Everytime they butt heads, their inplants became temporarily disabled, which allowed the Pachycephalosaurus to escape the Pachy Arena without being tracked.

    It is unknown as to why the website Pachycephalosaurus look very different from their original cloned counterparts, as in the security camera, the Pachycephalosaurus looked very different.

    Before the 2015 Isla Nublar Incident, an adult Pachycephalosaurus broke out of the Pachy Arena but was tranquilized and returned to the paddock by some Asset Containment Unit workers.
    """

    // MARK: - Complete
    static let mosasaurSceneDescriptions = """
    **Jurassic World**

    Gray and Zach Mitchell attended the Mosasaur Feeding Show and the Underwater Observatory in which they saw the Mosasaurus consume a shark.

    Following the escape of The Aviary's residents from their enclosure, the Mosasaurus devoured a Pteranodon that was flying over its enclosure to capture Zara Young, also eating Zara, who was in the talons of the Pteranodon.

    At the end of the battle between the Indominus rex, the park's veteran T. rex, and Blue the Velociraptor, the Mosasaurus beached itself to catch the hybrid in its jaws and dragged it to the bottom of the lagoon, thus killing it.

    **Jurassic World: Fallen Kingdom**

    It is revealed that the individual Mosasaurus seen in Jurassic World has survived the months it has spent on Isla Nublar. It was thought to be dead when the submarine went in to collect a sample of what was left of Indominus rex. The Mosasaurus then ate the sub, along with a mercenary trying to escape on a helicopter, and when the gates were left open, it escaped the lagoon and swam into the ocean. It was last seen trying to eat surfers off of a coast.
    """

    static let mosasaurJWorld = """
    Gray and Zach Mitchell attended the Mosasaur Feeding Show and the Underwater Observatory in which they saw the Mosasaurus consume a shark.

    Following the escape of The Aviary's residents from their enclosure, the Mosasaurus devoured a Pteranodon that was flying over its enclosure to capture Zara Young, also eating Zara, who was in the talons of the Pteranodon.

    At the end of the battle between the Indominus rex, the park's veteran T. rex, and Blue the Velociraptor, the Mosasaurus beached itself to catch the hybrid in its jaws and dragged it to the bottom of the lagoon, thus killing it.
    """

    static let mosasaurFallenKingdom = """
    It is revealed that the individual Mosasaurus seen in Jurassic World has survived the months it has spent on Isla Nublar. It was thought to be dead when the submarine went in to collect a sample of what was left of Indominus rex. The Mosasaurus then ate the sub, along with a mercenary trying to escape on a helicopter, and when the gates were left open, it escaped the lagoon and swam into the ocean. It was last seen trying to eat surfers off of a coast.
    """

    // MARK: - Complete
    static let indoraptorSceneDescriptions = """
    **Jurassic World: Fallen Kingdom**

    During Maisie Lockwood's sneaking into the laboratory sub-level where Dr. Wu and Eli Mills were conversing over the Indoraptor's faults, Maisie hid in a darkened hallway that led to the Indoraptor's cage. Unknowingly getting too close with her back to the hybrid's enclosure, she did not see the Indoraptor reach out to try and grab her, only to be alerted when one of his claws brushed her ponytail, causing her to run away screaming, leading to her being caught and confined to her room by Mills.

    During the Lockwood Manor Auction, the Indoraptor was introduced to a crowd of wealthy people who've come from all over the world to buy the dinosaurs who were evacuated from Isla Nublar. Unfortunately, the dinosaur isn't up for auction as he's only in the prototype stage, but it doesn’t stop the audience from bidding tremendous amounts of money on the hybrid. Gunnar Eversol begins to accept bids at the behest of Eli Mills, with Russian mobster Anton Orlov winning the bid. Owen Grady then shows up with a Stygimoloch and together they cause havoc, with Owen and the Indoraptor sharing a close glance at one another.

    The place empties, leaving only Ken Wheatley with the Indoraptor. He attempts to sedate the dinosaur, shooting him twice with tranquilizer darts, causing him to fall over, seemingly incapacitated. He then enters his cage with the plan of taking one of his teeth for his collection.

    The Indoraptor turns out to only be faking his sedation, and remains motionless for a brief time. He then smirks just before he rises, literally disarms Ken, and begins to maul and kill him. He escapes from the cage and then his tail breaks the elevator that Gunnar Eversol along with three other members from the auction were trying to escape in.

    The Indoraptor roars at Gunnar Eversol as he kills him and the other members off-screen. Moments later, he attacked and killed two of Eli Mill's guards. Owen Grady, Claire Dearing, and Maisie Lockwood run into the Indoraptor while trying to cross the main floor in the Lockwood Manor.

    He chases after them and separates Maisie from Claire and Owen, injuring Claire in the process. The Indoraptor pursues Maisie as she runs towards her bedroom. He then climbs into her room through the window and is about to snatch her from her bed when Owen shows up, armed with a gun he'd taken from a dead mercenary. He fires two rounds at the Dinosaur but it doesn't do much, bar stunning him for a brief time. As he approaches Owen, ready to attack, Blue arrives and begins to assault him, keeping him occupied while Owen and Maisie escape through the window.

    The Indoraptor pushes Blue out the window, with the two being separated from their fight, and he corners Owen and Maisie on the roof. Claire arrives behind it and points a laser at Owen, prompting him to attack, in an attempt to get him to fall through weakened glass. He moves and begins to fall through the glass roof, but manages to save and haul himself back up.

    The Indoraptor then recovers and moves to lunge towards Owen when Blue arrives once more and resumes her attack, with both tumbling through the glass in a deadlock grapple. Once they land, the Indoraptor gets impaled by the brow horns of a Agujaceratops skull and perishes within seconds. Blue sprints away, triumphant, with the body of the hybrid being left behind on the ceratopsian skull.

    It is unknown what happened with the hybrid’s body, but he was most likely disposed of, alongside the technology to create more Indoraptors in the fallout of his escape.
    """

    static let indoraptorFallenKingdom: String = """
    During Maisie Lockwood's sneaking into the laboratory sub-level where Dr. Wu and Eli Mills were conversing over the Indoraptor's faults, Maisie hid in a darkened hallway that led to the Indoraptor's cage. Unknowingly getting too close with her back to the hybrid's enclosure, she did not see the Indoraptor reach out to try and grab her, only to be alerted when one of his claws brushed her ponytail, causing her to run away screaming, leading to her being caught and confined to her room by Mills.

    During the Lockwood Manor Auction, the Indoraptor was introduced to a crowd of wealthy people who've come from all over the world to buy the dinosaurs who were evacuated from Isla Nublar. Unfortunately, the dinosaur isn't up for auction as he's only in the prototype stage, but it doesn’t stop the audience from bidding tremendous amounts of money on the hybrid. Gunnar Eversol begins to accept bids at the behest of Eli Mills, with Russian mobster Anton Orlov winning the bid. Owen Grady then shows up with a Stygimoloch and together they cause havoc, with Owen and the Indoraptor sharing a close glance at one another.

    The place empties, leaving only Ken Wheatley with the Indoraptor. He attempts to sedate the dinosaur, shooting him twice with tranquilizer darts, causing him to fall over, seemingly incapacitated. He then enters his cage with the plan of taking one of his teeth for his collection.

    The Indoraptor turns out to only be faking his sedation, and remains motionless for a brief time. He then smirks just before he rises, literally disarms Ken, and begins to maul and kill him. He escapes from the cage and then his tail breaks the elevator that Gunnar Eversol along with three other members from the auction were trying to escape in.

    The Indoraptor roars at Gunnar Eversol as he kills him and the other members off-screen. Moments later, he attacked and killed two of Eli Mill's guards. Owen Grady, Claire Dearing, and Maisie Lockwood run into the Indoraptor while trying to cross the main floor in the Lockwood Manor.

    He chases after them and separates Maisie from Claire and Owen, injuring Claire in the process. The Indoraptor pursues Maisie as she runs towards her bedroom. He then climbs into her room through the window and is about to snatch her from her bed when Owen shows up, armed with a gun he'd taken from a dead mercenary. He fires two rounds at the Dinosaur but it doesn't do much, bar stunning him for a brief time. As he approaches Owen, ready to attack, Blue arrives and begins to assault him, keeping him occupied while Owen and Maisie escape through the window.

    The Indoraptor pushes Blue out the window, with the two being separated from their fight, and he corners Owen and Maisie on the roof. Claire arrives behind it and points a laser at Owen, prompting him to attack, in an attempt to get him to fall through weakened glass. He moves and begins to fall through the glass roof, but manages to save and haul himself back up.

    The Indoraptor then recovers and moves to lunge towards Owen when Blue arrives once more and resumes her attack, with both tumbling through the glass in a deadlock grapple. Once they land, the Indoraptor gets impaled by the brow horns of a Agujaceratops skull and perishes within seconds. Blue sprints away, triumphant, with the body of the hybrid being left behind on the ceratopsian skull.

    It is unknown what happened with the hybrid’s body, but he was most likely disposed of, alongside the technology to create more Indoraptors in the fallout of his escape.
    """

    // MARK: - Complete
    static let indominusRexSceneDescriptions = """
    **Jurassic World**

    Two I. rex were meant to be kept in their own paddock that had walls with a height of 12 meters (40 feet). This was also planned in case one of them died. However, the older Indominus cannibalized her own sibling and would also attack the workers of her paddock as well. Three weeks before their paddock was open to the public, Simon Masrani visited the paddock. He had not been able to do so for many months due to him being needed for several meeting and events.[19] At the time of his visit, the lone Indominus was not fully grown and was only 12.2 meters (40 ft). Simon told Claire Dearing to consult Owen Grady to see if he was interested in taking a job requiring him to inspect the paddock for any vulnerabilities after seeing her attempt of breaking the glass in the observation deck.

    That same day, the Indominus later managed to avoid her temperature being picked up by the thermal cameras thanks to the frog DNA in her species and left claw marks on the walls to make them think she was able to climb over the enclosure's wall. When Owen Grady, paddock supervisor Nicholas Letting and worker Nick Kilgore came in to investigate the damaged paddock, the hybrid ambushed them as soon as they got word that she was still in the paddock, making a quick meal out of Kilgore in the process. As they fled, she managed to break through the door as it was not fully shut. Free at last, the I. rex managed to detect and eat Letting, but Owen evaded her by hiding under a nearby crane outside of her paddock and then cut the crane's fuel tank, masking his scent. The Indominus rex then headed off toward the Jurassic World park, attracted by the thermal signatures of the visitors there.

    The Indominus then came across a group of campers from Camp Cretaceous. After killing a Brachiosaurus and two employees trying to warn them, the Indominus tried to get Darius Bowman, Brooklynn, Ben Pincus, Kenji Kon, Sammy Gutierrez and Yasmina Fadoula by tearing down the observation deck they were on. However the campers managed to elude her by using a zipline to escape. It then tore apart their campground before coming across a caged Carnotaurus named Toro and used its great strength to tear down the fence, setting him free.

    Her escape was not reported to Jurassic World visitors because Simon Masrani thought the Asset Containment Unit would capture her by following her tracker implant. The I. rex traveled south of her paddock having detected the thermal signatures of the visitors in Main Street. She managed to claw out her tracker, along with some flesh still attached to it, and ambushed the team as soon as they arrived, killing most of the troopers, including Katashi Hamada, Craig, and other members of the team, convincing Owen that the island needed to be evacuated.

    This Indominus might have been responsible for opening one of the Gyrosphere Valley's fences to the Restricted Area of Isla Nublar.

    She then found brothers, Zach and Gray Mitchell, who were observing four Ankylosaurus in the island's Restricted Area after traveling through the opened gate and attacked the two. In her attack, she agitated one of the Ankylosaurus who proceeded to fight back against her though her counterattack ended with her being killed by the Indominus via rolling her onto her back and breaking her neck. She resumed attacking the two brothers by piercing her mid talon into the glass and rotated the vehicle so the boys could see their demise. She then attempted to chomp the Gyrosphere whole but got her mouth stuck. She attempted to smash it several times into the ground to crack it open, but the two brothers escaped by getting out of their damaged Gyrosphere and jumping off a waterfall. She gave out a loud roar in disappointment and headed to the Gyrosphere Valley.

    The Indominus soon encountered the kids from Camp Cretaceous again, along with Bumpy, a young Ankylosaurus, found an abandoned ACU van. Because he had a learner's permit, Kenji was able to drive it. The kids barely escaped from the pursuing hybrid by driving off a cliff and down a steep incline, seeking refuge in a private lab operated by Dr. Wu. Wu's assistant Eddie, who was hiding in the lab, stole the van and abandoned the children, only to be waylaid by Indominus who knocked the van off the road and killed him. After this, the kids found a second van parked nearby and were able to escape in that, despite the I. rex chasing them.

    Shortly afterward, the Indominus attacked a herd of Apatosaurus, killing five and fatally injuring one before moving on into the restricted area of Isla Nublar, leaving their bodies uneaten. While in the restricted area, the I. rex discovered Owen Grady and Claire Dearing inside the Visitor Center to which she took the opportunity to attack and chase them after pretending not to notice them and breaking through the ceiling. However, her pursuit of the humans ended when she saw the JW001 piloted by Masrani outfitted with a heavy machine gun in pursuit of her. She led her pursuer to the Jurassic World Aviary where she smashed through the enclosure's walls and scared the pterosaurs inside out of the aviary to the open hole she created. This was witnessed from afar by both Claire Dearing and Owen Grady as well as the Camp Cretaceous kids, who'd crashed their second van into a boulder. As the freed pterosaurs led to the destruction of JW001 and attacked the guests in Main Street, the Indominus traveled further into the restricted area of the island.

    That night in the restricted area the members of Jurassic World's Velociraptor pack found her. However, when she began communicating with the raptors, Owen realized and remarked that the Indominous was part raptor. She became the alpha of their pack. As the leader of the pack, she commanded the raptors that were under her control to attack the humans that came with them and were in the area, to which they followed this order. Upon the initiation of this order, the InGen Security troopers, Owen, and Barry Sembène, who were following the Velociraptors opened fire on the hybrid. She managed to escape the brawl that ensued as the small arms fire had little to no effect on her, but she did nearly collapse on the ground when she was hit by a rocket from one of the troopers while escaping.

    The I. rex finally arrived in Main Street where she met Owen, Claire, the Mitchell brothers, and the three remaining raptors once again, commanding the raptors to finish them off. Owen successfully attempts to regain Blue's trust by removing her camera only seconds before the hybrid's arrival. Blue once again regards Owen as her alpha. Blue screeches at the I. rex, shortly before it responded by knocking her into a wall, seemingly killing her. The raptors, now aligned with Owen's group again, proceeded to jump on and attack the Indominus while Owen provided extra fire, albeit ineffective fire, with his rifle. But the fight ends fairly quickly after the Indominus easily kills Delta by tossing her into a grill, incinerating her, and snatches and throws Echo away. With the raptors defeated, the Indominus rex then proceeded to resume hunting Owen and the Mitchell brothers who were huddled inside the Jurassic Traders Outpost, one of Main Street's shops. She nearly dragged Gray to her, but was stopped when Claire threw a flare at her, which then caused her to turn her attention to another dinosaur who challenged her: Jurassic World's veteran Tyrannosaurus rex.

    The T. rex carried out a heavy assault on Indominus, and the two dinosaurs engaged in a ferocious battle. Though the T. rex initially dominated the fight, she was eventually brought to the ground by the hybrid's strength, destroying the Jurassic Traders Outpost and almost killing Owen Grady, Gray, and Zach. The Indominus almost delivered the killing blow before she was attacked by Blue who was still alive from the onslaught. This allowed the tyrant to return to her feet and grab the I. rex by the neck, pushing her into many of Main Street's buildings, all while Blue assisted the Tyrannosaurus. Finally, she was flung to the edge of the Jurassic World Lagoon. The attacks from both the T. rex and Blue were so heavy that it caused the hybrid to actually bleed and pieces of metal were even sticking out of the left side of her torso. The I. rex got back up from the ground, however, still ready to fight the theropods once more. While she let out a roar, the lagoon's resident Mosasaurus detected the hybrid and proceeded to emerge out of the water to pull the I. rex under the water to her death.
    """

    static let indominusRexJWorld: String = """
    Two I. rex were meant to be kept in their own paddock that had walls with a height of 12 meters (40 feet). This was also planned in case one of them died. However, the older Indominus cannibalized her own sibling and would also attack the workers of her paddock as well. Three weeks before their paddock was open to the public, Simon Masrani visited the paddock. He had not been able to do so for many months due to him being needed for several meeting and events.[19] At the time of his visit, the lone Indominus was not fully grown and was only 12.2 meters (40 ft). Simon told Claire Dearing to consult Owen Grady to see if he was interested in taking a job requiring him to inspect the paddock for any vulnerabilities after seeing her attempt of breaking the glass in the observation deck.

    That same day, the Indominus later managed to avoid her temperature being picked up by the thermal cameras thanks to the frog DNA in her species and left claw marks on the walls to make them think she was able to climb over the enclosure's wall. When Owen Grady, paddock supervisor Nicholas Letting and worker Nick Kilgore came in to investigate the damaged paddock, the hybrid ambushed them as soon as they got word that she was still in the paddock, making a quick meal out of Kilgore in the process. As they fled, she managed to break through the door as it was not fully shut. Free at last, the I. rex managed to detect and eat Letting, but Owen evaded her by hiding under a nearby crane outside of her paddock and then cut the crane's fuel tank, masking his scent. The Indominus rex then headed off toward the Jurassic World park, attracted by the thermal signatures of the visitors there.

    The Indominus then came across a group of campers from Camp Cretaceous. After killing a Brachiosaurus and two employees trying to warn them, the Indominus tried to get Darius Bowman, Brooklynn, Ben Pincus, Kenji Kon, Sammy Gutierrez and Yasmina Fadoula by tearing down the observation deck they were on. However the campers managed to elude her by using a zipline to escape. It then tore apart their campground before coming across a caged Carnotaurus named Toro and used its great strength to tear down the fence, setting him free.

    Her escape was not reported to Jurassic World visitors because Simon Masrani thought the Asset Containment Unit would capture her by following her tracker implant. The I. rex traveled south of her paddock having detected the thermal signatures of the visitors in Main Street. She managed to claw out her tracker, along with some flesh still attached to it, and ambushed the team as soon as they arrived, killing most of the troopers, including Katashi Hamada, Craig, and other members of the team, convincing Owen that the island needed to be evacuated.

    This Indominus might have been responsible for opening one of the Gyrosphere Valley's fences to the Restricted Area of Isla Nublar.

    She then found brothers, Zach and Gray Mitchell, who were observing four Ankylosaurus in the island's Restricted Area after traveling through the opened gate and attacked the two. In her attack, she agitated one of the Ankylosaurus who proceeded to fight back against her though her counterattack ended with her being killed by the Indominus via rolling her onto her back and breaking her neck. She resumed attacking the two brothers by piercing her mid talon into the glass and rotated the vehicle so the boys could see their demise. She then attempted to chomp the Gyrosphere whole but got her mouth stuck. She attempted to smash it several times into the ground to crack it open, but the two brothers escaped by getting out of their damaged Gyrosphere and jumping off a waterfall. She gave out a loud roar in disappointment and headed to the Gyrosphere Valley.

    The Indominus soon encountered the kids from Camp Cretaceous again, along with Bumpy, a young Ankylosaurus, found an abandoned ACU van. Because he had a learner's permit, Kenji was able to drive it. The kids barely escaped from the pursuing hybrid by driving off a cliff and down a steep incline, seeking refuge in a private lab operated by Dr. Wu. Wu's assistant Eddie, who was hiding in the lab, stole the van and abandoned the children, only to be waylaid by Indominus who knocked the van off the road and killed him. After this, the kids found a second van parked nearby and were able to escape in that, despite the I. rex chasing them.

    Shortly afterward, the Indominus attacked a herd of Apatosaurus, killing five and fatally injuring one before moving on into the restricted area of Isla Nublar, leaving their bodies uneaten. While in the restricted area, the I. rex discovered Owen Grady and Claire Dearing inside the Visitor Center to which she took the opportunity to attack and chase them after pretending not to notice them and breaking through the ceiling. However, her pursuit of the humans ended when she saw the JW001 piloted by Masrani outfitted with a heavy machine gun in pursuit of her. She led her pursuer to the Jurassic World Aviary where she smashed through the enclosure's walls and scared the pterosaurs inside out of the aviary to the open hole she created. This was witnessed from afar by both Claire Dearing and Owen Grady as well as the Camp Cretaceous kids, who'd crashed their second van into a boulder. As the freed pterosaurs led to the destruction of JW001 and attacked the guests in Main Street, the Indominus traveled further into the restricted area of the island.

    That night in the restricted area the members of Jurassic World's Velociraptor pack found her. However, when she began communicating with the raptors, Owen realized and remarked that the Indominous was part raptor. She became the alpha of their pack. As the leader of the pack, she commanded the raptors that were under her control to attack the humans that came with them and were in the area, to which they followed this order. Upon the initiation of this order, the InGen Security troopers, Owen, and Barry Sembène, who were following the Velociraptors opened fire on the hybrid. She managed to escape the brawl that ensued as the small arms fire had little to no effect on her, but she did nearly collapse on the ground when she was hit by a rocket from one of the troopers while escaping.

    The I. rex finally arrived in Main Street where she met Owen, Claire, the Mitchell brothers, and the three remaining raptors once again, commanding the raptors to finish them off. Owen successfully attempts to regain Blue's trust by removing her camera only seconds before the hybrid's arrival. Blue once again regards Owen as her alpha. Blue screeches at the I. rex, shortly before it responded by knocking her into a wall, seemingly killing her. The raptors, now aligned with Owen's group again, proceeded to jump on and attack the Indominus while Owen provided extra fire, albeit ineffective fire, with his rifle. But the fight ends fairly quickly after the Indominus easily kills Delta by tossing her into a grill, incinerating her, and snatches and throws Echo away. With the raptors defeated, the Indominus rex then proceeded to resume hunting Owen and the Mitchell brothers who were huddled inside the Jurassic Traders Outpost, one of Main Street's shops. She nearly dragged Gray to her, but was stopped when Claire threw a flare at her, which then caused her to turn her attention to another dinosaur who challenged her: Jurassic World's veteran Tyrannosaurus rex.

    The T. rex carried out a heavy assault on Indominus, and the two dinosaurs engaged in a ferocious battle. Though the T. rex initially dominated the fight, she was eventually brought to the ground by the hybrid's strength, destroying the Jurassic Traders Outpost and almost killing Owen Grady, Gray, and Zach. The Indominus almost delivered the killing blow before she was attacked by Blue who was still alive from the onslaught. This allowed the tyrant to return to her feet and grab the I. rex by the neck, pushing her into many of Main Street's buildings, all while Blue assisted the Tyrannosaurus. Finally, she was flung to the edge of the Jurassic World Lagoon. The attacks from both the T. rex and Blue were so heavy that it caused the hybrid to actually bleed and pieces of metal were even sticking out of the left side of her torso. The I. rex got back up from the ground, however, still ready to fight the theropods once more. While she let out a roar, the lagoon's resident Mosasaurus detected the hybrid and proceeded to emerge out of the water to pull the I. rex under the water to her death.
    """

    // MARK: - Complete
    static let dimorphodonSceneDescriptions = """
    **Jurassic World**

    *Isla Nublar Incident (2015)*

    During the rampage of Jurassic World's latest attraction Indominus rex, all the residents in the Aviary, including Dimorphodon, were freed when the Indominus rex broke into the Aviary in its rampage, creating a large opening the Aviary. The pterosaurs then escaped and wreaked havoc on the island. A mixed flock of Dimorphodon and Pteranodon traveled to the Main Street of Jurassic World where they attacked the human visitors in the area, when Gray, Zach and Zara were stuck in the Main Street. Gray attempted to run to safety but this almost led to him being decapitated by a Dimorphodon but luckily Zach pulled him back just in time. One Dimorphodon attempted to attack Owen Grady by pouncing on him and tried to maul his face but it was shot down by Claire Dearing who picked up a dropped gun.

    One Dimorphodon managed to fly out of Isla Nublar, but was soon sniped by an InGen Soldier who saw it flying when he was being transported to the island. After the incident, any remaining Dimorphodon were flying wildly on the island.

    While no Dimorphodon appeared in Jurassic World: Fallen Kingdom, it has been revealed that there were surviving Dimorphodon populations on Isla Nublar, but as none were seen being taken to Lockwood Manor, it can be assumed that the species has fallen back into extinction, although being capable flyers, they may have flown off the island like the Pteranodons are seen doing so at the end of the film. However, some Dimorphodon were seen on a news cam at the beginning of the film while the newscaster talked about the Jurassic World Incident.
    """

    static let dimorphodonJWorld: String = """
    During the rampage of Jurassic World's latest attraction Indominus rex, all the residents in the Aviary, including Dimorphodon, were freed when the Indominus rex broke into the Aviary in its rampage, creating a large opening the Aviary. The pterosaurs then escaped and wreaked havoc on the island. A mixed flock of Dimorphodon and Pteranodon traveled to the Main Street of Jurassic World where they attacked the human visitors in the area, when Gray, Zach and Zara were stuck in the Main Street. Gray attempted to run to safety but this almost led to him being decapitated by a Dimorphodon but luckily Zach pulled him back just in time. One Dimorphodon attempted to attack Owen Grady by pouncing on him and tried to maul his face but it was shot down by Claire Dearing who picked up a dropped gun.

    One Dimorphodon managed to fly out of Isla Nublar, but was soon sniped by an InGen Soldier who saw it flying when he was being transported to the island. After the incident, any remaining Dimorphodon were flying wildly on the island.

    While no Dimorphodon appeared in Jurassic World: Fallen Kingdom, it has been revealed that there were surviving Dimorphodon populations on Isla Nublar, but as none were seen being taken to Lockwood Manor, it can be assumed that the species has fallen back into extinction, although being capable flyers, they may have flown off the island like the Pteranodons are seen doing so at the end of the film. However, some Dimorphodon were seen on a news cam at the beginning of the film while the newscaster talked about the Jurassic World Incident.
    """

    // MARK: - Complete
    static let dilophosaurusSceneDescription = """
    **Jurassic Park**

    The endorsement team was meant to see the Dilophosaurus in its paddock during their tour of Jurassic Park, but none revealed themselves to the visitors.

    When Dennis Nedry turned off the park's security systems so he could steal InGen's dinosaur embryos, Dilophosaurus was one of the many dinosaurs that were free to roam the island. A juvenile Dilophosaur stalked Nedry himself when he tried to get his vehicle unstuck out of a fallen tree limb. Feeling uneasy, Nedry stopped rope towing his jeep to face his stalker that was right behind him. Dennis Nedry tried to trick the dangerous dinosaur into fetching a stick for him, but the Dilophosaurus showed little care for the stick outside of the brief sound it made when it hit the forest floor. Angered that his trick was unsuccessful, Dennis Nedry jeered the Dilophosaur before running back to his jeep. However, when he turned around, the "Dilo" was there, and it popped up its frill before spraying venom at Nedry. It landed on his raincoat, and Nedry ran to his vehicle. But before he could get in, another shot by the Dilophosaur hit him straight in the eyes. Poor Dennis managed to get in his vehicle, but he lost the counterfeit shaving cream can that held the dinosaur embryos he stole. When he shut the door, he realized with horror the "Dilo" was inside, and it proceeded to devour him.

    It was confirmed on the DPG website that all five Dilophosaurs residing on Nublar during the Jurassic Park incident had survived to 1994 at least. Wild populations existed on Isla Sorna after Hurricane Clarissa struck the island because Dilophosaurus was among one of the information sheets given to the InGen Hunters during the Isla Sorna Incident and was also a screensaver for one of the computers inside the Fleetwood RV Mobile Lab that was used in the same incident.
    """

    static let dilophosaurusJPark: String = """
    The endorsement team was meant to see the Dilophosaurus in its paddock during their tour of Jurassic Park, but none revealed themselves to the visitors.

    When Dennis Nedry turned off the park's security systems so he could steal InGen's dinosaur embryos, Dilophosaurus was one of the many dinosaurs that were free to roam the island. A juvenile Dilophosaur stalked Nedry himself when he tried to get his vehicle unstuck out of a fallen tree limb. Feeling uneasy, Nedry stopped rope towing his jeep to face his stalker that was right behind him. Dennis Nedry tried to trick the dangerous dinosaur into fetching a stick for him, but the Dilophosaurus showed little care for the stick outside of the brief sound it made when it hit the forest floor. Angered that his trick was unsuccessful, Dennis Nedry jeered the Dilophosaur before running back to his jeep. However, when he turned around, the "Dilo" was there, and it popped up its frill before spraying venom at Nedry. It landed on his raincoat, and Nedry ran to his vehicle. But before he could get in, another shot by the Dilophosaur hit him straight in the eyes. Poor Dennis managed to get in his vehicle, but he lost the counterfeit shaving cream can that held the dinosaur embryos he stole. When he shut the door, he realized with horror the "Dilo" was inside, and it proceeded to devour him.

    It was confirmed on the DPG website that all five Dilophosaurs residing on Nublar during the Jurassic Park incident had survived to 1994 at least. Wild populations existed on Isla Sorna after Hurricane Clarissa struck the island because Dilophosaurus was among one of the information sheets given to the InGen Hunters during the Isla Sorna Incident and was also a screensaver for one of the computers inside the Fleetwood RV Mobile Lab that was used in the same incident.
    """

    // MARK: - Complete
    static let compsognathusSceneDescriptions = """
    **The Lost World: Jurassic Park**

    *Isla Sorna Incident (1997)*

    When the Bowman family went to Isla Sorna for vacation, Cathy Bowman encountered a Compsognathus scout on one of the island's beaches. She liked the small dinosaur and fed it some food. But to her and her family's horror the rest of the pack emerged from the nearby forest to attack Cathy, though she survived the attack.

    When Cathy's parents sued InGen for the injuries she sustained from the dinosaurs, this set course the events of the Isla Sorna Incident of 1997 where InGen's CEO John Hammond was fired and succeeded by his nephew Peter Ludlow who hired a team to capture dinosaurs living on Isla Sorna for Jurassic Park: San Diego whom he wanted to revive.

    During the Hunters' capture of the dinosaurs on the Game Trail, hunter Dieter Stark encountered a Compy whom he attacked with his taser for the fun of it.

    The hunters captured several Compsognathus and two of them were showcased by InGen CEO Peter Ludlow during his transmission to the board of his company. The Gatherers later freed at least three Compies from the encampment. The individuals in Ludlow's tent were most likely killed when the captured Triceratops freed by the Gatherers. It is unknown what became of the other individuals and whether or not they survived the chaos in the camp.

    When Dieter Stark went to urinate in the woods of Isla Sorna after the skirmish at the InGen Harvester Encampment, he encountered another Compsognathus. He proceeded to tase it like he had done the previous one he encountered before. This individual turned out to be a scout and its pack pursued Dieter who had gotten lost in the woods. They attacked once he tripped on a slope while trying to get back to his group.

    He managed to survive the attack and scared the pack away once he had removed them from his body. But the pack soon returned to attack Stark again at a stream where the Compies succeeded in killing him.

    **Jurassic Park III**

    *Isla Sorna Incident (2001)*

    During his stay on Isla Sorna, 12-year old Eric Kirby learned to use Tyrannosaurus urine to repel Compsognathus.

    Compsognathus were present during the battle with the Spinosaurus and Tyrannosaurus rex as the smaller dinosaurs ran for their lives as the two theropods fought to the death.

    When Dr. Alan Grant visited the truck that Eric was living in it a pack of Compies arrived near their location but they did not attack them and instead fed on some insects.

    **Jurassic World: Fallen Kingdom**

    It is revealed that there are surviving Compsognathus populations on Isla Nublar, but will now face an impending danger, alongside many other creatures, in the form of an erupting volcano.

    They are seen running alongside several other species from Mount Sibo.

    Several Compies have been rescued from the island alongside many other species in order to be sold at auction, and they are later seen running out of the Lockwood Manor after Maisie released all of the captured animals. They eventually eat some of Eli Mills’s remains after the latter was killed and devoured by the T. rex.
    """

    static let compsognathusLostWorld: String = """
    When the Bowman family went to Isla Sorna for vacation, Cathy Bowman encountered a Compsognathus scout on one of the island's beaches. She liked the small dinosaur and fed it some food. But to her and her family's horror the rest of the pack emerged from the nearby forest to attack Cathy, though she survived the attack.

    When Cathy's parents sued InGen for the injuries she sustained from the dinosaurs, this set course the events of the Isla Sorna Incident of 1997 where InGen's CEO John Hammond was fired and succeeded by his nephew Peter Ludlow who hired a team to capture dinosaurs living on Isla Sorna for Jurassic Park: San Diego whom he wanted to revive.

    During the Hunters' capture of the dinosaurs on the Game Trail, hunter Dieter Stark encountered a Compy whom he attacked with his taser for the fun of it.

    The hunters captured several Compsognathus and two of them were showcased by InGen CEO Peter Ludlow during his transmission to the board of his company. The Gatherers later freed at least three Compies from the encampment. The individuals in Ludlow's tent were most likely killed when the captured Triceratops freed by the Gatherers. It is unknown what became of the other individuals and whether or not they survived the chaos in the camp.

    When Dieter Stark went to urinate in the woods of Isla Sorna after the skirmish at the InGen Harvester Encampment, he encountered another Compsognathus. He proceeded to tase it like he had done the previous one he encountered before. This individual turned out to be a scout and its pack pursued Dieter who had gotten lost in the woods. They attacked once he tripped on a slope while trying to get back to his group.

    He managed to survive the attack and scared the pack away once he had removed them from his body. But the pack soon returned to attack Stark again at a stream where the Compies succeeded in killing him.
    """

    static let compsognathusJPark3: String = """
    During his stay on Isla Sorna, 12-year old Eric Kirby learned to use Tyrannosaurus urine to repel Compsognathus.

    Compsognathus were present during the battle with the Spinosaurus and Tyrannosaurus rex as the smaller dinosaurs ran for their lives as the two theropods fought to the death.

    When Dr. Alan Grant visited the truck that Eric was living in it a pack of Compies arrived near their location but they did not attack them and instead fed on some insects.
    """

    static let compsognathusFallenKingdom: String = """
    It is revealed that there are surviving Compsognathus populations on Isla Nublar, but will now face an impending danger, alongside many other creatures, in the form of an erupting volcano.

    They are seen running alongside several other species from Mount Sibo.

    Several Compies have been rescued from the island alongside many other species in order to be sold at auction, and they are later seen running out of the Lockwood Manor after Maisie released all of the captured animals. They eventually eat some of Eli Mills’s remains after the latter was killed and devoured by the T. rex.
    """

    // MARK: - Complete
    static let brachiosaurusSceneDesciptions = """
    **Jurassic Park**

    *Isla Nublar Incident*

    The Brachiosaurus was the first dinosaur encountered by the endorsement team hired by InGen to make sure Jurassic Park was safe for visitors. The entire team was amazed. Dr. Alan Grant and Dr. Ellie Sattler were the most awestruck of the group because the Brachiosaurus was terrestrial, not semi-aquatic swamp dwellers they had thought they were.

    When Dennis Nedry disabled Jurassic Park's security systems, the security fences that kept the prehistoric animals from escaping their enclosures were disabled as well, Brachiosaurus was one of the dinosaurs that were able to roam freely.

    After fleeing from the Tyrannosaur Paddock, Dr. Alan Grant and Tim and Lex Murphy climbed a tree where saw a herd of Brachiosaurus feeding on the nearby trees, hooting in the distance. Dr. Alan Grant heard their calls and attempted to imitate them to successful results. The following morning, a Brachiosaurus sick with a cold or a similar disease fed on the tree that the three humans were sleeping in, waking them up. Lex panicked at the sight of the dinosaur, believing it to be dangerous at first, but she soon calmed down when Dr. Alan Grant and her brother showed her that it was harmless. Dr. Grant fed the Brachiosaurus a nearby branch on the tree and Tim Murphy even pet it. However, when Lex attempted to pet the dinosaur like her brother did, the Brachiosaurus responded by sneezing on her. The humans and the Brachiosaurus later went their separate ways.

    It is unknown what happened to the Brachiosaur populations on Isla Nublar after the Isla Nublar Incident of 1993.

    However, according to information revealed by InGen reports, there were at least 5 surviving Brachiosaurus on the island by October 1994. One died due to malnutrition.

    **Jurassic Park III**

    *Isla Sorna Rescue Mission*

    Passengers of the plane N622DC saw a herd of Brachiosaurus during their fly-over of Isla Sorna at the beginning of the Isla Sorna Incident of 2001.

    Another herd was seen by Dr. Alan Grant and the Kirby family at a river bank.

    **Jurassic World: Fallen Kingdom**

    It is revealed that there are some surviving Brachiosaurus populations on Isla Nublar, but the species faces danger in the form of an impending erupting volcano.

    A Brachiosaurus is later seen walking down the ruins of Main Street, in front of Owen, Claire, Zia and others.

    A Brachiosaurus skeleton was seen near the radio tower's hatch.

    When Mt. Sibo erupts, the Brachiosaurs were among the dinosaurs stampeding from the eruption, facing many heavy casualties, most notably: as the boat Arcadia leaves Nublar to its fate, a Brachiosaurus, the same one seen by Grant and Sattler 25 years ago, is seen walking down the East Dock, crying out and standing on its hind legs as it is slowly engulfed by the toxic smoke and debris from the erupting volcano, letting out its final cries.

    Despite the massive casualties, the species' survival is confirmed by the Arcadia's manifest, and by J.A. Bayona himself, which shows that at least two adult Brachiosaurus had been captured and escaped the estate off-screen.

    Some of Mill's mercenaries managed to salvage its viable embryo, as seen during Malcolm's voiced over final testimony with the committee, implying that more Brachiosaurus may be engineered in the future.
    """

    static let brachiosaurusJPark: String = """
    The Brachiosaurus was the first dinosaur encountered by the endorsement team hired by InGen to make sure Jurassic Park was safe for visitors. The entire team was amazed. Dr. Alan Grant and Dr. Ellie Sattler were the most awestruck of the group because the Brachiosaurus was terrestrial, not semi-aquatic swamp dwellers they had thought they were.

    When Dennis Nedry disabled Jurassic Park's security systems, the security fences that kept the prehistoric animals from escaping their enclosures were disabled as well, Brachiosaurus was one of the dinosaurs that were able to roam freely.

    After fleeing from the Tyrannosaur Paddock, Dr. Alan Grant and Tim and Lex Murphy climbed a tree where saw a herd of Brachiosaurus feeding on the nearby trees, hooting in the distance. Dr. Alan Grant heard their calls and attempted to imitate them to successful results. The following morning, a Brachiosaurus sick with a cold or a similar disease fed on the tree that the three humans were sleeping in, waking them up. Lex panicked at the sight of the dinosaur, believing it to be dangerous at first, but she soon calmed down when Dr. Alan Grant and her brother showed her that it was harmless. Dr. Grant fed the Brachiosaurus a nearby branch on the tree and Tim Murphy even pet it. However, when Lex attempted to pet the dinosaur like her brother did, the Brachiosaurus responded by sneezing on her. The humans and the Brachiosaurus later went their separate ways.

    It is unknown what happened to the Brachiosaur populations on Isla Nublar after the Isla Nublar Incident of 1993.

    However, according to information revealed by InGen reports, there were at least 5 surviving Brachiosaurus on the island by October 1994. One died due to malnutrition.
    """

    static let brachiosaurusJPark3: String = """
    Passengers of the plane N622DC saw a herd of Brachiosaurus during their fly-over of Isla Sorna at the beginning of the Isla Sorna Incident of 2001.

    Another herd was seen by Dr. Alan Grant and the Kirby family at a river bank.
    """

    static let brachiosaurusFallenKingdom: String = """
    It is revealed that there are some surviving Brachiosaurus populations on Isla Nublar, but the species faces danger in the form of an impending erupting volcano.

    A Brachiosaurus is later seen walking down the ruins of Main Street, in front of Owen, Claire, Zia and others.

    A Brachiosaurus skeleton was seen near the radio tower's hatch.

    When Mt. Sibo erupts, the Brachiosaurs were among the dinosaurs stampeding from the eruption, facing many heavy casualties, most notably: as the boat Arcadia leaves Nublar to its fate, a Brachiosaurus, the same one seen by Grant and Sattler 25 years ago, is seen walking down the East Dock, crying out and standing on its hind legs as it is slowly engulfed by the toxic smoke and debris from the erupting volcano, letting out its final cries.

    Despite the massive casualties, the species' survival is confirmed by the Arcadia's manifest, and by J.A. Bayona himself, which shows that at least two adult Brachiosaurus had been captured and escaped the estate off-screen.

    Some of Mill's mercenaries managed to salvage its viable embryo, as seen during Malcolm's voiced over final testimony with the committee, implying that more Brachiosaurus may be engineered in the future.
    """
}