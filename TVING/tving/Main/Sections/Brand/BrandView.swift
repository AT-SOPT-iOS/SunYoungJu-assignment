//
//  BrandView.swift
//  tving
//
//  Created by 선영주 on 6/2/25.
//

import SwiftUI

struct BrandView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 7) {
                ForEach(brandData.indices, id: \.self) { index in
                    BrandViewCell(logoName: brandData[index].logoName)
                }
            }
            .padding()
        }
    }
}

struct BrandViewCell: View {
    let logoName: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(Color(red: 37/255, green: 37/255, blue: 37/255))
                .frame(width: 90, height: 45)

            Image(logoName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 68, height: 34)
                .clipped()
        }
    }
}

#Preview {
    BrandView()
}
