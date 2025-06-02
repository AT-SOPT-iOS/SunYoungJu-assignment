//
//  BoxOfficeResponse.swift
//  TVING
//
//  Created by 선영주 on 5/9/25.
//
import Foundation

// MARK: - 전체 응답
struct BoxOfficeResponse: Codable {
    let boxOfficeResult: BoxOfficeResult
}

// MARK: - 박스오피스 결과
struct BoxOfficeResult: Codable {
    let dailyBoxOfficeList: [MovieInfo]
}

// MARK: - 영화 정보
struct MovieInfo: Codable {
    let rank: String
    let movieNm: String
    let audiAcc: String
}
