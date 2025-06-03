//
//  MenuBarView.swift
//  tving
//
//  Created by 선영주 on 6/2/25.
//

import SwiftUI

struct MenuBarView: View {
    @Binding var selectedIndex: Int
    let titles = ["홈", "드라마", "예능", "영화", "스포츠", "뉴스"]

    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(titles.indices, id: \.self) { index in
                        VStack(spacing: 4) {
                            Button(action: {
                                withAnimation {
                                    selectedIndex = index
                                }
                            }) {
                                Text(titles[index])
                                    .font(.system(size: 17))
                                    .foregroundColor(selectedIndex == index ? .white : .gray)
                            }

                            Rectangle()
                                .fill(selectedIndex == index ? Color.white : Color.clear)
                                .frame(height: 2)
                        }
                    }
                }
                .padding(.horizontal, 10)
                .frame(height: 30)
            }

            Rectangle()
                .fill(Color(red: 44/255, green: 44/255, blue: 44/255))
                .frame(height: 1)
        }
        .background(Color.black)
    }
}
