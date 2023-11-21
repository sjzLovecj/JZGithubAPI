//
//  JZGHRequest.swift
//  JZGithubDemo
//
//  Created by S JZ on 2023/11/16.
//

import Foundation
import Alamofire

public class JZGHRequest {

    static public func request<Value: Decodable>(_ urlStr: String, 
                                          method: HTTPMethod = .get,
                                          params: [String : Any]? = nil,
                                          header: [String : String]? = nil,
                                          type: Value.Type = JZGHBaseModel.self,
                                          requestSuccess: ((Value) -> ())? = nil,
                                          requestFail: ((AFError) -> ())? = nil) async {
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
        debugPrint("--------------开始--------------")
        debugPrint(response)
        debugPrint("--------------结束--------------")
        debugPrint("\n\n")
#endif
        let result = await dataTask.result
        
        // 主线中处理返回后的操作
        DispatchQueue.main.async {
            switch result {
            case .success(let success):
                // 先赋值
//                debugPrint(success)
                requestSuccess?(success)
            case .failure(let failure):
                // 处理错误信息
//                requestWithError(failure)
                
                requestFail?(failure)
                
            }
        }
    }
    
    static public  func requestWithError(_ error: AFError) {
        // 首先输出error
//        debugPrint(error)
        // 是否处理error，重新登录等
        
    }
    
    /// 获取用户Token
    /// - Parameters:
    ///   - codeValue: 授权页面成功后，返回URL中拼接的code
    ///   - complete: 结果回调
    static public func getAccessToken(_ codeValue: String, requestSuccess: ((JZGHAccessToken) -> ())? = nil, requestFail: ((AFError) -> ())? = nil) {
        Task {
            var params: [String : Any] = [:]
            params["client_id"] = JZGHManager.CLIENT_ID
            params["client_secret"] = JZGHManager.CLIENT_SECRET
            params["code"] = codeValue
            
            let header = ["Accept" : "application/json"]

            await JZGHRequest.request("https://github.com/login/oauth/access_token", method: .post, params: params, header: header, type: JZGHAccessToken.self, requestSuccess: requestSuccess, requestFail: requestFail)
        }
    }
    
    static public func getUserInfo(_ accessToken: String, requestSuccess: ((JZGHUserInfo) -> ())? = nil, requestFail: ((AFError) -> ())? = nil) {
        Task {
            let authValue = String(format: "Bearer %@", accessToken)
            let header: [String : String] = ["Accept" : "application/json", "Content-Type" : "application/json", "Authorization" : authValue]
            await request("https://api.github.com/user", method: .get, header: header, type: JZGHUserInfo.self, requestSuccess: requestSuccess, requestFail: requestFail)
        }
    }
    
}

