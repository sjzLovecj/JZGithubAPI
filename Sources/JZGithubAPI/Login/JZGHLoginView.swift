//
//  JZGHLoginView.swift
//  JZGithubDemo
//
//  Created by S JZ on 2023/11/15.
//

import SwiftUI

public class JZGHAuthModel: ObservableObject {
    @Published public var urlString: String = ""
    @Published public var isShowLoginView: Bool = false
    
    
    public init() { }
}

public struct JZGHLoginView: View {
    @EnvironmentObject var authModel: JZGHAuthModel
    public init() { }
    
    public var body: some View {
        // 1.生成两个按钮
        //  - token登录
        //  - auth登录
        //  - 有title 与 cancel按钮

        VStack {
            headerView()
            
            
        }
    }
    
    func headerView() -> some View {
        ZStack(alignment: .center) {
            Text("选择登录方式")
            HStack {
                Spacer()
                Text("取消")
            }
        }
        .frame(height: 50)
    }
    
    func buttonView() -> some View {
        VStack {
            
        }
        .padding(15)
    }
    
}

#Preview {
    JZGHLoginView()
}
