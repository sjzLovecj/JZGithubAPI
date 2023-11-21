//
//  JZGHLoginViewModifier.swift
//
//
//  Created by S JZ on 2023/11/21.
//

import SwiftUI

struct JZGHLoginViewModifier: ViewModifier {
    @Binding var isPresented: Bool
    var loginDone: ((Bool) -> ())?
    @StateObject var loginModel: JZGHLoginModel = JZGHLoginModel()
    
    func body(content: Content) -> some View {
        content
            .onAppear(perform: {
                let authPath: String = String(format: "%@?client_id=%@", JZGHManager.GITHUB_AUTHURL, JZGHManager.CLIENT_ID)
                loginModel.urlString = authPath
            })
            .sheet(isPresented: $isPresented) {
                if !JZGHManager.shared.ACCESS_TOKEN.isEmpty {
                    loginDone?(true)
                }else {
                    loginDone?(false)
                }
            } content: {
                JZGHLoginView(isPresented: $isPresented)
                    .environmentObject(loginModel)
            }
    }
}

public extension View {
    func githubLogin(_ isPresented: Binding<Bool>,_ loginDone:  ((Bool) -> ())?) -> some View {
        self.modifier(JZGHLoginViewModifier(isPresented: isPresented, loginDone: loginDone))
    }
}


