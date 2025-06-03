//
//  HeaderView.swift
//  tving
//
//  Created by 선영주 on 6/2/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Image("TVING_Main")
                .resizable()
                .scaledToFit()
                .frame(height: 78)

            Spacer()

            Button(action: {}) {
                Image("Search")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 30, height: 30)
            }

            Image("TVING_Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
        }
        .padding(.horizontal, 11)
        .frame(height: 60)
        .background(Color.black)
    }
}

#Preview{
    HeaderView()
}
