//
//  CustomTextField.swift
//  tving
//
//  Created by 선영주 on 6/2/25.
//

//
//  CustomTextField.swift
//  tving
//
//  Created by 선영주 on 6/2/25.
//

import SwiftUI

struct CustomTextField: View {

    @Binding var text: String
    var placeholder: String
    var isSecure: Bool = false
    var isPasswordVisible: Bool = false
    var togglePasswordVisibility: (() -> Void)? = nil

    var body: some View {
        HStack {
            // MARK: - 입력 필드 + 플레이스홀더 영역
            ZStack(alignment: .leading) {
                // 플레이스홀더 커스텀
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(Color("gray2"))
                        .padding(.leading, 2)
                }

                // 일반 입력 또는 비밀번호 입력 필드
                if isSecure && !isPasswordVisible {
                    SecureField("", text: $text)
                        .foregroundColor(.white)
                } else {
                    TextField("", text: $text)
                        .foregroundColor(.white)
                }
            }

            // MARK: - x 버튼 (입력 초기화용)
            if !text.isEmpty {
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(Color("gray3"))
                }
            }

            // MARK: - 비밀번호 보기 토글 버튼
            if isSecure {
                Button(action: {
                    togglePasswordVisibility?()
                }) {
                    Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor(Color("gray3"))
                }
            }
        }
        .padding(.horizontal, 12)
        .frame(height: 52)
        .background(Color("gray4"))
        .cornerRadius(3)
    }
}
