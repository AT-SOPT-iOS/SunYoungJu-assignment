//
//  MovieView.swift
//  tving
//
//  Created by 선영주 on 6/3/25.
//

import SwiftUI

struct MovieView: View {
    let items = MovieModel.dummy()

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("실시간 인기 영화")
                    .foregroundColor(.white)
                    .font(.system(size: 15, weight: .bold))

                Spacer()

                Button(action: {
                    print("더보기 눌림")
                }) {
                    Text("더보기")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .medium))
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 5)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 4) {
                    ForEach(items) { item in
                        MovieCard(model: item)
                    }
                }
                .padding(.leading, 20)
            }
        }
        .background(Color.black)
    }
}

struct MovieCard: View {
    let model: MovieModel

    var body: some View {
        Image(model.imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 150, height: 200)
            .clipped()
            .cornerRadius(3)
            .padding(.vertical, 6) // 위아래 여백 동일하게
            .padding(.trailing, 4)
    }
}

#Preview {
    MovieView()
}
