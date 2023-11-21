//
//  JZGHTokenView.swift
//
//
//  Created by S JZ on 2023/11/21.
//

import SwiftUI

struct JZGHTokenView: View {
    @Binding var isPresented: Bool
    @State private var inputText: String = ""
    
    var body: some View {
        VStack(spacing: 10) {
            // 输入框
            TextField("请输入Token", text: $inputText)
                .frame(width: 260, height: 35)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.gray))
            
            Button {
                if !inputText.isEmpty {
                    JZGHManager.shared.ACCESS_TOKEN = inputText
                }
                isPresented = false
            } label: {
                Text("使用Token登录")
                    .font(.system(size: 16))
                    .frame(width: 260, height: 35)
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 10)
        .padding(.bottom, 10)
    }
}

#Preview {
    JZGHTokenView(isPresented: .constant(true))
}
