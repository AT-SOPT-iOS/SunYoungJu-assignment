//
//  MasterpieceView.swift
//  tving
//
//  Created by 선영주 on 6/2/25.
//

import SwiftUI

struct MasterpieceView: View {
    let items = MasterpieceModel.dummy()

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // 제목
            Text("선영주PD의 인생작 TOP 6")
                .foregroundColor(.white)
                .font(.system(size: 15, weight: .bold))
                .padding(.horizontal, 10)
                .padding(.top, 5)

            // 수평 스크롤 뷰
            GeometryReader { geometry in
                let cellWidth = (geometry.size.width - 60) / 2.2

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(items, id: \.id) { model in
                            MasterpieceCell(model: model)
                                .frame(width: cellWidth, height: 90)
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
            .frame(height: 90)
        }
        .background(Color.black)
    }
}

struct MasterpieceCell: View {
    let model: MasterpieceModel

    var body: some View {
        Image(model.imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 160, height: 90)
            .clipped()
            .cornerRadius(3)
    }
}

#Preview {
    MasterpieceView()
}
