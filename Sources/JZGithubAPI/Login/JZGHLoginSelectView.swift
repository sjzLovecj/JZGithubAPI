//
//  JZGHLoginSelectView.swift
//
//
//  Created by S JZ on 2023/11/21.
//

import SwiftUI

struct JZGHLoginSelectView: View {
    @Binding var isPresented: Bool
    @EnvironmentObject var loginModel: JZGHLoginModel

    var body: some View {
        VStack(spacing: 0) {
            JZGHLoginHeadView(isPresented: $isPresented, titleStr: "选择登录方式")
            buttonView()
        }
        #if os(iOS)
        .frame(width: geometry.size.height - 40)
        #else
        .frame(width: 300)
        #endif
    }
    
    func buttonView() -> some View {
        VStack(spacing: 10) {
            Button {
                loginModel.loginType = .tokenLogin
            } label: {
                Text("使用Token登录")
                    .font(.system(size: 16))
                    .frame(width: 260, height: 35)
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
            }
            .buttonStyle(.plain)

            Button {
                loginModel.loginType = .authLogin
            } label: {
                Text("使用Auth登录")
                    .font(.system(size: 16))
                    .frame(width: 260, height: 35)
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
            }
            .buttonStyle(.plain)
        }
        .padding(.vertical, 10)
        .padding(.bottom, 10)
    }
}

#Preview {
    JZGHLoginSelectView(isPresented: .constant(true))
}
