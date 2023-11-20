//
//  JZGHRequest.swift
//  JZGithubDemo
//
//  Created by S JZ on 2023/11/16.
//

import Foundation
import Alamofire

//var params: [String : Any] = [:]
//params["client_id"] = JZGHManager.CLIENT_ID
//params["client_secret"] = JZGHManager.CLIENT_SECRET
//params["code"] = codeValue
//
//var header: HTTPHeaders = HTTPHeaders()
//header.add(name: "Accept", value: "application/json")
//AF.request("https://github.com/login/oauth/access_token", method: .post, parameters: params, headers: header).response { response in
//    debugPrint(response)
//}

//{"access_token":"ghu_Btx8I5hey6ZblyT6JUKrgf0KJDfpMZ4Jy7rc",
//"expires_in":28800,"refresh_token":"ghr_nguEBauP2mewcPCevOttH057ZZGNvTeXEFIhVNJTUXuha7uiT6lEBD2tEoa9LuNClOqHVy3BznX6","refresh_token_expires_in":15724800,"token_type":"bearer","scope":""}


public class JZGHRequest {

    static public func request<Value: Decodable>(_ urlStr: String, 
                                          method: HTTPMethod = .get,
                                          params: [String : Any]? = nil,
                                          header: [String : String]? = nil,
                                          type: Value.Type = JZGHBaseModel.self,
                                          requestSuccess: ((Value) -> ())? = nil) async {
        // 创建Headers
        var httpHeader: HTTPHeaders?
        if let header {
            httpHeader = HTTPHeaders()
            header.forEach { (key, value) in
                httpHeader?.add(name: key, value: value)
            }
        }
        let dataTask = AF.request(urlStr, method: method, parameters: params, headers: httpHeader).serializingDecodable(type)
#if DEBUG
        let response = await dataTask.response
        debugPrint(response)
#endif
        let result = await dataTask.result
        
        // 主线中处理返回后的操作
        DispatchQueue.main.async {
            switch result {
            case .success(let success):
                // 先赋值
                debugPrint(success)
                requestSuccess?(success)
            case .failure(let failure):
                // 处理错误信息
                requestWithError(failure)
            }
        }
    }
    
    static public  func requestWithError(_ error: AFError) {
        // 首先输出error
        debugPrint(error)
        // 是否处理error，重新登录等
        
    }
    
    /// 获取用户Token
    /// - Parameters:
    ///   - codeValue: 授权页面成功后，返回URL中拼接的code
    ///   - complete: 结果回调
    static public func getAccessToken(_ codeValue: String, requestSuccess: @escaping (JZGHAccessToken) -> ()) {
        Task {
            var params: [String : Any] = [:]
            params["client_id"] = JZGHManager.CLIENT_ID
            params["client_secret"] = JZGHManager.CLIENT_SECRET
            params["code"] = codeValue
            
            let header = ["Accept" : "application/json"]

            await JZGHRequest.request("https://github.com/login/oauth/access_token", method: .post, params: params, header: header, type: JZGHAccessToken.self, requestSuccess: requestSuccess)
        }
    }
    
    static public func getUserInfo(_ accessToken: String, requestSuccess: @escaping (JZGHUserInfo) -> ()) {
        Task {
            let authValue = String(format: "Bearer %@", accessToken)
            let header: [String : String] = ["Accept" : "application/json", "Content-Type" : "application/json", "Authorization" : authValue]
            await request("https://api.github.com/user", method: .get, header: header, type: JZGHUserInfo.self, requestSuccess: requestSuccess)
        }
    }
    
}

