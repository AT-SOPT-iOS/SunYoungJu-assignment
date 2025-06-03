//
//  NicknameBottomSheetView.swift
//  tving
//
//  Created by 선영주 on 6/2/25.
//

import SwiftUI

struct NicknameBottomSheetView: View {
    @Binding var nickname: String
    var onSave: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("닉네임을 입력해주세요")
                .font(.system(size: 23, weight: .medium))
                .foregroundColor(.black)
                .padding(.top, 50)

            TextField("닉네임", text: $nickname)
                .padding(.horizontal, 12)
                .frame(height: 52)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(6)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.black)

            Spacer()

            Button(action: {
                onSave()
            }) {
                Text("저장하기")
                    .frame(maxWidth: .infinity)
                    .frame(height: 52)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.bottom, 24)
        }
        .padding(.horizontal, 24)
        .presentationDetents([.medium])
        .presentationCornerRadius(20)
    }
}
