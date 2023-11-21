//
//  JZGHLoginHeadView.swift
//  
//
//  Created by S JZ on 2023/11/21.
//

import SwiftUI

struct JZGHLoginHeadView: View {
    @Binding var isPresented: Bool
    @EnvironmentObject var loginModel: JZGHLoginModel
    
    var titleStr: String = ""
    
    var body: some View {
        ZStack(alignment: .center) {
            Text(titleStr)
                .font(.system(size: 16, weight: .medium))
            
            HStack {
                Spacer()
                Text("取消")
                    .padding(.trailing)
                    .onTapGesture {
                        isPresented = false
                    }
            }
        }
        .frame(height: 50)
    }
}

#Preview {
    JZGHLoginHeadView(isPresented: .constant(true), titleStr: "请选择登录方式")
}
