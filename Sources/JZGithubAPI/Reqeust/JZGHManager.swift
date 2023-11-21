//
//  JZGHManager.swift
//  JZGithubDemo
//
//  Created by S JZ on 2023/11/15.
//

import SwiftUI

public struct JZGHManager {
    static public let shared: JZGHManager = JZGHManager()
    @AppStorage("SHOWLOGINView") public var isShowLoginView: Bool = true
    
    // 在UserDeflue中存储
    @AppStorage("ACCESS_TOKEN") public var ACCESS_TOKEN: String = ""
        
    // 先给个回调值
    static public var CLIENT_ID: String = ""
    static public  var CLIENT_SECRET: String = ""

    // GETHUB 授权接口
    static public var GITHUB_AUTHURL: String = "https://github.com/login/oauth/authorize"
    static public var GITHUB_CALLBACKURL: String = "http://localhost:8080"
    
    static public func setClient(id: String = "", secret: String = "") {
        CLIENT_ID = id
        CLIENT_SECRET = secret
    }
    
}
