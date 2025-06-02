//
//  BoxOfficeService.swift
//  TVING
//
//  Created by 선영주 on 5/9/25.
//
import Foundation

class BoxOfficeService {
    static let shared = BoxOfficeService()

    private let apiKey = "dbb58cfcd4af937a562fcef3cb586ca6"

    func fetchDailyBoxOffice(targetDate: String, completion: @escaping ([MovieInfo]) -> Void) {
        let urlString = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=\(apiKey)&targetDt=\(targetDate)&itemPerPage=6"

        print("최종 요청 URL: \(urlString)")

        guard let url = URL(string: urlString) else {
            print("URL 생성 실패")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("네트워크 오류: \(error.localizedDescription)")
                completion([])
                return
            }

            guard let data = data else {
                print("데이터 없음")
                completion([])
                return
            }

            do {
                let decoded = try JSONDecoder().decode(BoxOfficeResponse.self, from: data)
                completion(decoded.boxOfficeResult.dailyBoxOfficeList)
            } catch {
                print("디코딩 실패: \(error)")
                if let rawString = String(data: data, encoding: .utf8) {
                    print("서버 응답 원본:\n\(rawString)")
                }
                completion([])
            }
        }.resume()
    }
}
