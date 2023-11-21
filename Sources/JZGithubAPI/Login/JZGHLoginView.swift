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
    @Published public var isShowLoginView: Bool = false
    @Published public var loginType: JZGHLoginType = .selectLogin
    
    public init() { }
}

public struct JZGHLoginView: View {
    @EnvironmentObject var authModel: JZGHLoginModel
    public init() { }
    
    public var body: some View {
        // 1.生成两个按钮
        //  - token登录
        //  - auth登录
        //  - 有title 与 cancel按钮

        VStack {
            headerView()
            
            buttonView()
        }
        #if os(iOS)
        .frame(width: geometry.size.height - 40)
        #else
        .frame(width: 300)
        #endif
    }
    
    func headerView() -> some View {
        ZStack(alignment: .center) {
            Text("选择登录方式")
                .font(.system(size: 16, weight: .medium))
            
            HStack {
                Spacer()
                Text("取消")
                    .padding(.trailing)
                    .onTapGesture {
                        authModel.isShowLoginView = false
                    }
            }
        }
        .frame(height: 50)
    }
    func buttonView() -> some View {
        VStack(spacing: 10) {
            Button {
                
            } label: {
                Text("使用Token登录")
                    .frame(width: 260, height: 40)
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
            }
            .buttonStyle(.plain)

            Button {
                
            } label: {
                Text("使用Auth登录")
                    .frame(width: 260, height: 40)
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
            }
            .buttonStyle(.plain)
        }
        .padding(10)
    }
}

#Preview {
    JZGHLoginView()
}
