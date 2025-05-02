//
//  MasterpieceModel.swift
//  TVING
//
//  Created by 선영주 on 5/1/25.
//
import UIKit

struct MasterpieceModel {
    let image: UIImage
}

extension MasterpieceModel {
    static func dummy() -> [MasterpieceModel] {
        return [
            MasterpieceModel(image: UIImage(named: "live5")!),
            MasterpieceModel(image: UIImage(named: "live4")!),
            MasterpieceModel(image: UIImage(named: "live3")!),
            MasterpieceModel(image: UIImage(named: "live2")!),
            MasterpieceModel(image: UIImage(named: "live6")!),
            MasterpieceModel(image: UIImage(named: "live1")!)
        ]
    }
}
