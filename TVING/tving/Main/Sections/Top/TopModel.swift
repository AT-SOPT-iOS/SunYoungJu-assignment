//
//  TopModel.swift
//  tving
//
//  Created by 선영주 on 6/2/25.
//

import SwiftUI

struct TopModel: Identifiable {
    let id = UUID()
    let rank: Int
    let imageName: String
}

extension TopModel {
    static func dummy() -> [TopModel] {
        return [
            TopModel(rank: 1, imageName: "poster1"),
            TopModel(rank: 2, imageName: "poster2"),
            TopModel(rank: 3, imageName: "poster3"),
            TopModel(rank: 4, imageName: "poster4"),
            TopModel(rank: 5, imageName: "poster5"),
            TopModel(rank: 6, imageName: "poster6"),
            TopModel(rank: 7, imageName: "poster7"),
            TopModel(rank: 8, imageName: "poster8"),
            TopModel(rank: 9, imageName: "poster9"),
            TopModel(rank: 10, imageName: "poster10"),
            TopModel(rank: 11, imageName: "poster11"),
            TopModel(rank: 12, imageName: "poster12"),
            TopModel(rank: 13, imageName: "poster13"),
            TopModel(rank: 14, imageName: "poster14"),
            TopModel(rank: 15, imageName: "poster15"),
            TopModel(rank: 16, imageName: "poster16"),
            TopModel(rank: 17, imageName: "poster17"),
            TopModel(rank: 18, imageName: "poster18"),
            TopModel(rank: 19, imageName: "poster19"),
            TopModel(rank: 20, imageName: "poster20")
        ]
    }
}
