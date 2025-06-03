//
//  BaseballModel.swift
//  tving
//
//  Created by 선영주 on 6/2/25.
//

import SwiftUI

struct BaseballModel: Identifiable {
    let id = UUID()
    let imageName: String
}

extension BaseballModel {
    static func dummy() -> [BaseballModel] {
        return [
            BaseballModel(imageName: "baseball1"),
            BaseballModel(imageName: "baseball2"),
            BaseballModel(imageName: "baseball3"),
            BaseballModel(imageName: "baseball4"),
            BaseballModel(imageName: "baseball5"),
            BaseballModel(imageName: "baseball6"),
            BaseballModel(imageName: "baseball7"),
            BaseballModel(imageName: "baseball8"),
            BaseballModel(imageName: "baseball9"),
            BaseballModel(imageName: "baseball10")
        ]
    }
}
