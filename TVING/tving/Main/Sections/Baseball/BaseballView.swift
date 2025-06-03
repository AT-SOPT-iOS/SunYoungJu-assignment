//
//  BaseballView.swift
//  tving
//
//  Created by 선영주 on 6/2/25.
//

import SwiftUI

struct BaseballView: View {
    let items = BaseballModel.dummy()

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 7) {
                ForEach(Array(items.enumerated()), id: \.1.id) { index, model in
                    BaseballViewCell(model: model, index: index)
                }
            }
            .padding(.leading, 15)
            .padding(.trailing, 15)
            .padding(.top, 5)
        }
        .background(Color.black)
    }
}

struct BaseballViewCell: View {
    let model: BaseballModel
    let index: Int

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .fill(index % 2 == 0 ? Color.white : Color.black)
                .frame(width: 80, height: 50)

            Image(model.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 45, height: 45)
        }
    }
}

#Preview {
    BaseballView()
}
