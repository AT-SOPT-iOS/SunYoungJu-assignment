//
//  FooterView.swift
//  tving
//
//  Created by 선영주 on 6/2/25.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Group {
                    Text("공지")
                        .foregroundColor(.gray)
                    +
                    Text("   티빙 계정 공유 정책 추가 안내")
                        .foregroundColor(.white)
                }
                .font(.system(size: 11))

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundColor(.white)
                    .font(.system(size: 11))
            }
            .padding()
            .background(Color(red: 37/255, green: 37/255, blue: 37/255))
            .cornerRadius(8)


            HStack(spacing: 3) {
                Text("고객문의")
                Text("·")
                Text("이용약관")
                Text("·")
                Text("개인정보처리방침")
                    .bold()
                    .foregroundColor(.white)
            }
            .font(.system(size: 11))
            .foregroundColor(Color("gray2"))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 13)

            HStack(spacing: 3) {
                Text("사업자정보")
                Text("·")
                Text("인재채용")
            }
            .font(.system(size: 11))
            .foregroundColor(Color("gray2"))
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 16)
        .padding(.top, 20)
        .padding(.bottom, 20)
        .background(Color.black)
    }
}

#Preview {
    FooterView()
}
