//
//  BoxOfficeService .swift
//  tving
//
//  Created by 선영주 on 6/3/25.
//

// BoxOfficeService.swift

import Foundation

// MARK: - 응답 모델

struct BoxOfficeResponse: Codable {
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult: Codable {
    let dailyBoxOfficeList: [MovieInfo]
}

struct MovieInfo: Codable, Identifiable {
    var id: String { rank } // ForEach에서 필요
    let rank: String
    let movieNm: String
    let audiAcc: String
}

// MARK: - 서비스 클래스

class BoxOfficeService {
    static let shared = BoxOfficeService()
    private let apiKey = "dbb58cfcd4af937a562fcef3cb586ca6"

    func fetchDailyBoxOffice(targetDate: String, completion: @escaping ([MovieInfo]) -> Void) {
        let urlString = "https://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=\(apiKey)&targetDt=\(targetDate)&itemPerPage=10"

        guard let url = URL(string: urlString) else {
            print("❌ URL 생성 실패")
            completion([])
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("❌ 네트워크 오류: \(error.localizedDescription)")
                completion([])
                return
            }

            guard let data = data else {
                print("❌ 데이터 없음")
                completion([])
                return
            }

            do {
                let decoded = try JSONDecoder().decode(BoxOfficeResponse.self, from: data)
                completion(decoded.boxOfficeResult.dailyBoxOfficeList)
            } catch {
                print("❌ 디코딩 실패: \(error)")
                if let raw = String(data: data, encoding: .utf8) {
                    print("🔍 원본 응답:\n\(raw)")
                }
                completion([])
            }
        }.resume()
    }
}
