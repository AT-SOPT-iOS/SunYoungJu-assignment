//
//  BannerModel.swift
//  TVING
//
//  Created by 선영주 on 5/1/25.
//
import UIKit

struct BannerModel {
    let image: UIImage
}

extension BannerModel {
    static func dummy() -> [BannerModel] {
        return [
            BannerModel(image: UIImage(named: "banner1")!),
            BannerModel(image: UIImage(named: "banner2")!),
            BannerModel(image: UIImage(named: "banner3")!),
            BannerModel(image: UIImage(named: "banner4")!),
            BannerModel(image: UIImage(named: "banner5")!),
            BannerModel(image: UIImage(named: "banner6")!),
            BannerModel(image: UIImage(named: "banner7")!)
        ]
    }
}
