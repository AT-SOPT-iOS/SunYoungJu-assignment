//
//  TopView.swift
//  tving
//
//  Created by 선영주 on 6/2/25.
//

import SwiftUI

struct TopView: View {
    let items = TopModel.dummy()

    var body: some View {
        VStack(alignment: .leading, spacing: 13) {
            Text("오늘의 티빙 TOP 20")
                .foregroundColor(.white)
                .font(.system(size: 15, weight: .bold))
                .padding(.leading, 5)
                .padding(.top, 5)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 11) {
                    ForEach(0..<items.count, id: \.self) { index in
                        TopCard(model: items[index])
                    }
                }
                .padding(.leading, 2)
            }
        }
        .background(Color.black)
    }
}

struct TopCard: View {
    let model: TopModel

    var body: some View {
        HStack(alignment: .bottom, spacing: 3) {
            Text("\(model.rank)")
                .font(.system(size: 58, weight: .heavy))
                .foregroundColor(.white)
                .rotationEffect(.degrees(5))

            Image(model.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 98, height: 146)
                .clipped()
                .cornerRadius(3)
        }
        .frame(width: 150, height: 170)
    }
}

#Preview {
    TopView()
}
