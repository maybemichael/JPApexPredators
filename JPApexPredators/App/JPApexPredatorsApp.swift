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

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(apexPredatorsViewModel)
        }
    }

    init() {
        adjustVisualAppearance()
    }

    private func adjustVisualAppearance() {
        var navigationBarLayoutMargins: UIEdgeInsets = .zero
        navigationBarLayoutMargins.left = AppAppearenceConstants.standardMarginSpacing
        navigationBarLayoutMargins.right = navigationBarLayoutMargins.left
        UINavigationBar.appearance().layoutMargins = navigationBarLayoutMargins

        var tableViewLayoutMargins: UIEdgeInsets = .zero
        tableViewLayoutMargins.left = AppAppearenceConstants.standardMarginSpacing
        tableViewLayoutMargins.right = tableViewLayoutMargins.left
        UITableView.appearance().layoutMargins = tableViewLayoutMargins
    }
}
