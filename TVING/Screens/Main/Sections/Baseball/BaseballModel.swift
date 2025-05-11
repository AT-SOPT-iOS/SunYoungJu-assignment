//
//  BaseballModel.swift
//  TVING
//
//  Created by 선영주 on 5/1/25.
//
import UIKit

struct BaseballModel {
    let teamLogo: UIImage
}

extension BaseballModel {
    static func dummy() -> [BaseballModel] {
        return [
            BaseballModel(teamLogo: UIImage(named: "baseball1")!),
            BaseballModel(teamLogo: UIImage(named: "baseball2")!),
            BaseballModel(teamLogo: UIImage(named: "baseball3")!),
            BaseballModel(teamLogo: UIImage(named: "baseball4")!),
            BaseballModel(teamLogo: UIImage(named: "baseball5")!),
            BaseballModel(teamLogo: UIImage(named: "baseball6")!),
            BaseballModel(teamLogo: UIImage(named: "baseball7")!),
            BaseballModel(teamLogo: UIImage(named: "baseball8")!),
            BaseballModel(teamLogo: UIImage(named: "baseball9")!),
            BaseballModel(teamLogo: UIImage(named: "baseball10")!),
        ]
    }
}
