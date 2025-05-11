//
//  LiveModel.swift
//  TVING
//
//  Created by 선영주 on 5/1/25.
//
import UIKit

struct LiveModel {
    let rank: Int
    let image: UIImage
    let broadcaster: String
    let title: String
    let rating: String
}

extension LiveModel {
    static func from(movieInfo: MovieInfo) -> LiveModel {
        return LiveModel(
            rank: Int(movieInfo.rank) ?? 0,
            image: UIImage(named: "live\(movieInfo.rank)") ?? UIImage(named: "defaultPoster")!,
            broadcaster: "영화관",
            title: movieInfo.movieNm,
            rating: "관객수: \(movieInfo.audiAcc)명"
        )
    }
}
