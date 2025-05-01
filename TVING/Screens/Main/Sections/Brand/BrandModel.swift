//
//  BrandModel.swift
//  TVING
//
//  Created by 선영주 on 5/1/25.
//
import UIKit

struct BrandModel {
    let logo: UIImage
}

extension BrandModel {
    static func dummy() -> [BrandModel] {
        return [
            BrandModel(logo: UIImage(named: "brand1")!),
            BrandModel(logo: UIImage(named: "brand2")!),
            BrandModel(logo: UIImage(named: "brand3")!),
            BrandModel(logo: UIImage(named: "brand4")!),
            BrandModel(logo: UIImage(named: "brand1")!),
            BrandModel(logo: UIImage(named: "brand2")!),
            BrandModel(logo: UIImage(named: "brand3")!),
            BrandModel(logo: UIImage(named: "brand4")!)
        ]
    }
}
