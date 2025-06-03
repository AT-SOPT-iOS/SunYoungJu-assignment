//
//  MainView.swift
//  tving
//
//  Created by 선영주 on 6/2/25.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = 0

    var body: some View {
        VStack(spacing: 0) {
            HeaderView()
                .padding(.top, 44)

            MenuBarView(selectedIndex: $selectedTab)

            ScrollView {
                VStack(spacing: 10) {
                    if selectedTab == 0 {
                        BannerView()
                        TopView()
                        LiveView()
                        MovieView()
                        BaseballView()
                        BrandView()
                        MasterpieceView()
                        FooterView()
                    } else if selectedTab == 3 {
                        // 영화 탭: 영화진흥위원회 api 연결해보았습니다용
                        BoxOfficeView()
                    } else {
                        Text("Hello, World!")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .bold))
                            .padding(.top, 200)
                    }
                }
            }
        }
        .background(Color.black)
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    MainView()
}

#Preview {
    MainView()
}
