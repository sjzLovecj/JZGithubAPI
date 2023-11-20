//
//  JZGHManager.swift
//  JZGithubDemo
//
//  Created by S JZ on 2023/11/15.
//

import SwiftUI

// client secret: 1a3a9197e5ab3cac835d86c4d01a86092a192f81
// client id:  Iv1.31d805f688c6ce7b

public struct JZGHManager {
    static public let shared: JZGHManager = JZGHManager()
    @AppStorage("SHOWLOGINView") public var isShowLoginView: Bool = true
    
    // 在UserDeflue中存储
    @AppStorage("ACCESS_TOKEN") public var ACCESS_TOKEN: String = ""
        
    // 先给个回调值
    static public var CLIENT_ID: String = "Iv1.31d805f688c6ce7b"
    static public  var CLIENT_SECRET: String = "1a3a9197e5ab3cac835d86c4d01a86092a192f81"

    // GETHUB 授权接口
    static public var GITHUB_AUTHURL: String = "https://github.com/login/oauth/authorize"
    static public var GITHUB_CALLBACKURL: String = "http://localhost:8080"
    
    static public func setClient(id: String = "", secret: String = "") {
        CLIENT_ID = id
        CLIENT_SECRET = secret
    }
    
}
