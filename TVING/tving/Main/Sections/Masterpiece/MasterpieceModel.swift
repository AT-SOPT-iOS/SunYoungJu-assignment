//
//  MasterpieceModel.swift
//  tving
//
//  Created by 선영주 on 6/3/25.
//

import SwiftUI

struct MasterpieceModel: Identifiable {
    let id = UUID()
    let imageName: String
}

extension MasterpieceModel {
    static func dummy() -> [MasterpieceModel] {
        return [
            MasterpieceModel(imageName: "live5"),
            MasterpieceModel(imageName: "live4"),
            MasterpieceModel(imageName: "live3"),
            MasterpieceModel(imageName: "live2"),
            MasterpieceModel(imageName: "live6"),
            MasterpieceModel(imageName: "live1")
        ]
    }
}
