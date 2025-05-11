//
//  MovieModel.swift
//  TVING
//
//  Created by 선영주 on 5/1/25.
//
import UIKit

struct MovieModel {
    let image: UIImage
}

extension MovieModel {
    static func dummy() -> [MovieModel] {
        return [
            MovieModel(image: UIImage(named: "poster20")!),
            MovieModel(image: UIImage(named: "poster19")!),
            MovieModel(image: UIImage(named: "poster18")!),
            MovieModel(image: UIImage(named: "poster17")!),
            MovieModel(image: UIImage(named: "poster16")!),
            MovieModel(image: UIImage(named: "poster15")!)
        ]
    }
}
