//
//  BannerModel.swift
//  tving
//
//  Created by 선영주 on 6/2/25.
//

import SwiftUI

struct BannerModel: Identifiable {
    let id = UUID()
    let imageName: String
}

extension BannerModel {
    static func dummy() -> [BannerModel] {
        return [
            BannerModel(imageName: "banner1"),
            BannerModel(imageName: "banner2"),
            BannerModel(imageName: "banner3"),
            BannerModel(imageName: "banner4"),
            BannerModel(imageName: "banner5"),
            BannerModel(imageName: "banner6"),
            BannerModel(imageName: "banner7")
        ]
    }
}
