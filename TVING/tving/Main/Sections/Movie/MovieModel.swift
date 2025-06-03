//
//  MovieModel.swift
//  tving
//
//  Created by 선영주 on 6/2/25.
//

import SwiftUI

struct MovieModel: Identifiable {
    let id = UUID()
    let imageName: String
}

extension MovieModel {
    static func dummy() -> [MovieModel] {
        return [
            MovieModel(imageName: "poster20"),
            MovieModel(imageName: "poster19"),
            MovieModel(imageName: "poster18"),
            MovieModel(imageName: "poster17"),
            MovieModel(imageName: "poster16"),
            MovieModel(imageName: "poster15")
        ]
    }
}
