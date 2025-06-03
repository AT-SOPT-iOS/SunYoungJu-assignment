//
//  LoginView.swift
//  tving
//
//  Created by 선영주 on 6/2/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var isLoggedIn: Bool = false
    @State private var goToWelcome = false
    @State private var showNicknameSheet = false
    @State private var nickname: String = ""
    

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Spacer().frame(height: 80)

                Text("TVING ID 로그인")
                    .foregroundColor(.white)
                    .font(.system(size: 23, weight: .medium))
                    .padding(.bottom, 31)

                Group {
                    CustomTextField(text: $email, placeholder: "아이디")

                    Spacer().frame(height: 11)

                    CustomTextField(
                        text: $password,
                        placeholder: "비밀번호",
                        isSecure: true,
                        isPasswordVisible: isPasswordVisible,
                        togglePasswordVisibility: {
                            isPasswordVisible.toggle()
                        }
                    )
                }
                .padding(.horizontal, 24)

                NavigationLink(destination: WelcomeView(id: nickname.isEmpty ? email : nickname), isActive: $isLoggedIn) {
                    EmptyView()
                }

                Button(action: {
                    if !email.isEmpty && !password.isEmpty {
                        isLoggedIn = true
                    }
                }) {
                    Text("로그인하기")
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(email.isEmpty || password.isEmpty ? Color("gray4") : Color("red"))
                        .foregroundColor(email.isEmpty || password.isEmpty ? Color("gray2") : .white)
                        .cornerRadius(3)
                }
                .padding(.horizontal, 24)
                .padding(.top, 32)
                .disabled(email.isEmpty || password.isEmpty)

                HStack(spacing: 36) {
                    Button("아이디 찾기", action: {})
                        .foregroundColor(Color("gray2"))
                        .font(.system(size: 14, weight: .semibold))

                    Text("|")
                        .foregroundColor(Color("gray4"))

                    Button("비밀번호 찾기", action: {})
                        .foregroundColor(Color("gray2"))
                        .font(.system(size: 14, weight: .semibold))
                }
                .padding(.top, 32)

                HStack(spacing: 22) {
                    Text("아직 계정이 없으신가요?")
                        .foregroundColor(Color("gray3"))
                        .font(.system(size: 14, weight: .medium))

                    Button(action: {
                        showNicknameSheet = true
                    }) {
                        Text("닉네임 만들러가기")
                            .underline()
                            .foregroundColor(Color("gray2"))
                            .font(.system(size: 14, weight: .medium))
                    }
                    .sheet(isPresented: $showNicknameSheet) {
                        NicknameBottomSheetView(nickname: $nickname) {
                            showNicknameSheet = false
                        }
                    }
                }
                .padding(.top, 32)

                Spacer()
            }
            .background(Color.black.ignoresSafeArea())
        }
    }
}

#Preview {
    LoginView()
}
