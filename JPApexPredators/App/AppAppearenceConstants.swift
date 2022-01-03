//
//  AppAppearenceConstants.swift
//  JPApexPredators
//
//  Created by Michael McGrath on 12/29/21.
//

import SwiftUI

struct AppAppearenceConstants {
    static let detailViewImageSize: CGFloat = UIScreen.main.bounds.width / 1.5

    static let detailViewImageWidth: CGFloat = UIScreen.main.bounds.width - 40

    static let detailViewImageHeight: CGFloat = UIScreen.main.bounds.width - 100

    static let typeTextOffset: CGFloat = UIScreen.main.bounds.width / 3.5

    static let cellImageSize: CGFloat = 55

    static let standardSiblingViewSpacing: CGFloat = 8

    static let menuItemIconSize: CGFloat = 25

    static let standardMarginSpacing: CGFloat = 20

    static let mainViewNavigationTitle: String = "Apex Predators"

    static let cellImageCornerRadius: CGFloat = 7

    static let filterMenuMovieLabelTitle: String = "Filter by Movie"

    static let filterMenuTypeLabelTitle: String = "Filter by Type"

    static let sortMenuLabelTitle: String = "Sort by Name"

    static let detailViewTypeLabel: String = "Type:"

    static let detailViewAppearsInLabel: String = "Appears in:"

    enum MenuIcon: Int {
        case movieFilterLabelIcon
        case typeFilterLabelIcon
        case filterMenuIcon
        case sortLabelIcon
        case sortMenuIcon

        var imageName: String {
            switch self {
            case .movieFilterLabelIcon:
                return "MovieIconSmall"
            case .typeFilterLabelIcon:
                return "DinoTypeIconSmall"
            case .filterMenuIcon:
                return "FilterIcon"
            case .sortLabelIcon:
                return "SortLabelIcon"
            case .sortMenuIcon:
                return "SortIcon"
            }
        }
    }
}
