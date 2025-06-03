//
//  LiveView.swift
//  tving
//
//  Created by 선영주 on 6/2/25.
//

import SwiftUI

struct LiveView: View {
    let items = LiveModel.dummy()

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("실시간 인기 LIVE")
                    .foregroundColor(.white)
                    .font(.system(size: 15, weight: .bold))

                Spacer()

                Button(action: {}) {
                    Text("더보기")
                        .foregroundColor(Color("gray2"))
                        .font(.system(size: 15, weight: .regular))
                }
            }
            .padding(.horizontal, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(items) { item in
                        VStack(alignment: .leading, spacing: 5) {
                            Image(item.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 160, height: 80)
                                .clipped()
                                .cornerRadius(3)

                            HStack(alignment: .firstTextBaseline, spacing: 5) {
                                Text("\(item.rank)")
                                    .font(.system(size: 32, weight: .heavy))
                                    .foregroundColor(.white)
                                    .rotationEffect(.degrees(5))

                                Text(item.broadcaster)
                                    .font(.system(size: 14, weight: .bold))
                                    .foregroundColor(.white)
                            }

                            Text(item.title)
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(.white)

                            Text(item.rating)
                                .font(.system(size: 13, weight: .bold))
                                .foregroundColor(Color("gray2"))
                        }
                        .frame(width: 160, height: 170, alignment: .topLeading)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
        .background(.black)
    }
}

#Preview{
    LiveView()
}
