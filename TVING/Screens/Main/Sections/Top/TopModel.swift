//
//  TopModel.swift
//  TVING
//
//  Created by 선영주 on 5/1/25.
//
import UIKit

struct TopModel {
    let rank: Int
    let poster: UIImage
}

extension TopModel {
    static func dummy() -> [TopModel] {
        return [
            TopModel(rank: 1, poster: UIImage(named: "poster1")!),
            TopModel(rank: 2, poster: UIImage(named: "poster2")!),
            TopModel(rank: 3, poster: UIImage(named: "poster3")!),
            TopModel(rank: 4, poster: UIImage(named: "poster4")!),
            TopModel(rank: 5, poster: UIImage(named: "poster5")!),
            TopModel(rank: 6, poster: UIImage(named: "poster6")!),
            TopModel(rank: 7, poster: UIImage(named: "poster7")!),
            TopModel(rank: 8, poster: UIImage(named: "poster8")!),
            TopModel(rank: 9, poster: UIImage(named: "poster9")!),
            TopModel(rank: 10, poster: UIImage(named: "poster10")!),
            TopModel(rank: 11, poster: UIImage(named: "poster11")!),
            TopModel(rank: 12, poster: UIImage(named: "poster12")!),
            TopModel(rank: 13, poster: UIImage(named: "poster13")!),
            TopModel(rank: 14, poster: UIImage(named: "poster14")!),
            TopModel(rank: 15, poster: UIImage(named: "poster15")!),
            TopModel(rank: 16, poster: UIImage(named: "poster16")!),
            TopModel(rank: 17, poster: UIImage(named: "poster17")!),
            TopModel(rank: 18, poster: UIImage(named: "poster18")!),
            TopModel(rank: 19, poster: UIImage(named: "poster19")!),
            TopModel(rank: 20, poster: UIImage(named: "poster20")!)
        ]
    }
}
