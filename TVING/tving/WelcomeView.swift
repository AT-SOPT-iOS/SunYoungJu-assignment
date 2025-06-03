//
//  WelcomeView.swift
//  tving
//
//  Created by 선영주 on 6/2/25.
//

import SwiftUI

struct WelcomeView: View {
    var id: String
    @State private var goToMain = false

    var body: some View {
        VStack {
            Spacer().frame(height: 58)

            Image("TVING")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width)
                .frame(height: UIScreen.main.bounds.width * 210.938 / 375)

            Spacer().frame(height: 68)

            Text("\(id) 님\n반가워요!")
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .font(.system(size: 23, weight: .heavy))
                .lineSpacing(13.8)

            Spacer()

            NavigationLink(destination: MainView(), isActive: $goToMain) {
                EmptyView()
            }

            Button(action: {
                goToMain = true
            }) {
                Text("메인으로")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 57)
                    .background(Color("red"))
                    .cornerRadius(3)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
        }
        .background(Color("black"))
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

//#Preview {
//    WelcomeView(id: "영주")
//}
