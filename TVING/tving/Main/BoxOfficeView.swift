//
//  BoxOfficeView.swift
//  tving
//
//  Created by 선영주 on 6/3/25.
//

import SwiftUI

struct BoxOfficeView: View {
    @State private var movies: [MovieInfo] = []

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("🎬 박스오피스 TOP 10")
                .font(.title)
                .bold()
                .foregroundColor(.white)
                .padding(.top, 20)
                .padding(.horizontal)

            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(movies) { movie in
                        VStack(alignment: .leading, spacing: 4) {
                            Text("\(movie.rank). \(movie.movieNm)")
                                .font(.headline)
                                .foregroundColor(.white)

                            Text("누적 관객수: \(movie.audiAcc)명")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color(red: 30/255, green: 30/255, blue: 30/255))
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
            }
        }
        .background(Color.black.ignoresSafeArea())
        .onAppear(perform: fetchBoxOffice)
    }

    private func fetchBoxOffice() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        let targetDate = formatter.string(from: yesterday)

        print("📅 조회 날짜: \(targetDate)")

        BoxOfficeService.shared.fetchDailyBoxOffice(targetDate: targetDate) { fetched in
            DispatchQueue.main.async {
                self.movies = fetched
                for m in fetched {
                    print("🎥 \(m.rank). \(m.movieNm) / 👥 \(m.audiAcc)명")
                }
            }
        }
    }
}

#Preview {
    BoxOfficeView()
}
