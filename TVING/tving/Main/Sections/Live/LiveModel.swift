//
//  LiveModel.swift
//  tving
//
//  Created by 선영주 on 6/2/25.
//

import SwiftUI

struct LiveModel: Identifiable {
    let id = UUID()
    let rank: Int
    let imageName: String
    let broadcaster: String
    let title: String
    let rating: String
}

extension LiveModel {
    static func dummy() -> [LiveModel] {
        return [
            LiveModel(rank: 1, imageName: "live1", broadcaster: "JTBC", title: "이혼숙려캠프 34화", rating: "27.2%"),
            LiveModel(rank: 2, imageName: "live2", broadcaster: "뿅뿅지구오락실", title: "14화", rating: "24.1%"),
            LiveModel(rank: 3, imageName: "live3", broadcaster: "뭐쓰지", title: "17화", rating: "48.1%"),
            LiveModel(rank: 4, imageName: "live4", broadcaster: "드라마", title: "14화", rating: "24.1%"),
            LiveModel(rank: 5, imageName: "live5", broadcaster: "영화", title: "50화", rating: "14.4%"),
            LiveModel(rank: 6, imageName: "live6", broadcaster: "다큐", title: "38화", rating: "11.3%")
        ]
    }
}
