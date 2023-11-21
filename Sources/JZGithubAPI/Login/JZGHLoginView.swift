//
//  JZGHLoginView.swift
//  JZGithubDemo
//
//  Created by S JZ on 2023/11/15.
//

import SwiftUI

public enum JZGHLoginType: Int {
    case selectLogin
    case tokenLogin
    case authLogin
}

public class JZGHLoginModel: ObservableObject {
    @Published public var urlString: String = ""
    @Published public var loginType: JZGHLoginType = .selectLogin
    public init() { }
}

 struct JZGHLoginView: View {
    @Binding var isPresented: Bool
    @EnvironmentObject var loginModel: JZGHLoginModel

    var body: some View {
        // 1.生成两个按钮
        //  - token登录
        //  - auth登录
        //  - 有title 与 cancel按钮

        if loginModel.loginType == .selectLogin {
            JZGHLoginSelectView(isPresented: $isPresented)
        }else if loginModel.loginType == .tokenLogin {
            VStack(spacing: 0) {
                JZGHLoginHeadView(isPresented: $isPresented, titleStr: "使用Token登录")
                JZGHTokenView(isPresented: $isPresented)
            }
        }else if loginModel.loginType == .authLogin {
            VStack(spacing: 0) {
                JZGHLoginHeadView(isPresented: $isPresented, titleStr: "使用Auth登录")
                JZGHAuthView(isPresented: $isPresented)
                    .frame(width: 400, height: 600)
            }
        }
    }
}

#Preview {
    JZGHLoginView(isPresented: .constant(true))
}
