//
//  BannerView.swift
//  tving
//
//  Created by 선영주 on 6/2/25.
//

import SwiftUI

struct BannerView: View {
    let banners = BannerModel.dummy()

    var body: some View {
        TabView {
            ForEach(banners) { banner in
                Image(banner.imageName)
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .frame(height: 400)
    }
}

#Preview {
    BannerView()
}
