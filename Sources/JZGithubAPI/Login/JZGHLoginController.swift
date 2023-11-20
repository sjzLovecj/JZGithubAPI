//
//  JZGHLoginController.swift
//  JZGithubDemo
//
//  Created by S JZ on 2023/11/14.
//

/**
 * 参考文档：
 * https://www.6hu.cc/archives/206387.html
 * https://codeleading.com/article/87561178882/
 * https://www.codenong.com/52446904/
 */

//#if os(macOS)
//import AppKit
//import SwiftUI
//public typealias JZViewController = NSViewController
//
//struct JZGHAuthView: NSViewControllerRepresentable {
//    func makeNSViewController(context: Context) -> some NSViewController {
//        return JZGHLoginController()
//    }
//    
//    func updateNSViewController(_ nsViewController: NSViewControllerType, context: Context) {
//        
//    }
//}
//#else
//import UIKit
//import SwiftUI
//
//public typealias JZViewController = UIViewController
//struct JZGHAuthView: UIViewControllerRepresentable {
//    func makeUIViewController(context: Context) -> some UIViewController {
//        return JZGHLoginController()
//    }
//    
//    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//        
//    }
//}
//
//#endif
//
//
//import WebKit
////import Alamofire
//
//// 授权页面地址  https://github.com/login/oauth/authorize?client_id=
//// client id:  Iv1.31d805f688c6ce7b
//
//public class JZGHLoginController: JZViewController {
//    private lazy var webView: WKWebView = {
//        let confifuration = WKWebViewConfiguration()
//        confifuration.userContentController = WKUserContentController()
//        confifuration.preferences = WKPreferences()
//        confifuration.preferences.minimumFontSize = 10
//        confifuration.preferences.javaScriptCanOpenWindowsAutomatically = true
//        
//        confifuration.processPool = WKProcessPool()
////        confifuration.allowsInlineMediaPlayback = true
//        confifuration.allowsAirPlayForMediaPlayback = true
//        let webView = WKWebView(frame: .zero, configuration: confifuration)
//        webView.navigationDelegate = self
////        webView.uiDelegate = self
////        webView.scrollView.delegate = self
//        
//        webView.allowsBackForwardNavigationGestures = true
//        return webView
//    }()
//
//    public override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        view.addSubview(webView)
//        
//        if !JZGHManager.CLIENT_ID.isEmpty {
//            let authPath: String = String(format: "%@?client_id=%@", JZGHManager.GITHUB_AUTHURL, JZGHManager.CLIENT_ID)
//            if let authURL = URL(string: authPath) {
//                let authRequest = URLRequest(url: authURL)
//                webView.load(authRequest)
//            }
//        }
//    }
//    
//#if os(macOS)
//    public override func loadView() {
//        self.view = NSView()
//    }
//    
//    public override func viewDidLayout() {
//        super.viewDidLayout()
//        webView.frame = view.bounds
//    }
//#else
//    public override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        webView.frame = view.bounds
//    }
//#endif
//}
//
//extension JZGHLoginController: WKNavigationDelegate {
//    // 拦截回调的URL
//    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
//        // 拦截回调地址
//        if let currentURL = navigationAction.request.url, currentURL.absoluteString.contains(JZGHManager.GITHUB_CALLBACKURL) {
//            // 返回的回调"http://localhost:8080/?code=805036151054ebbd77b2"
//            debugPrint(currentURL.absoluteString)
//            
//            // 解析回调地址，获取Code
//            getCode(fromCallBack: currentURL)
//            
//            decisionHandler(.cancel)
//        }
//
//        decisionHandler(.allow)
//    }
//    
//    private func getCode(fromCallBack url: URL) {
//        if let query = url.query() {
//            let codeValue = query.replacingOccurrences(of: "code=", with: "")
//            // 请求获取access_token
//            JZGHRequest.getAccessToken(codeValue) { tokenModel in
//                // 存储Token
//                if let access_token = tokenModel.access_token {
//                    JZGHManager.shared.ACCESS_TOKEN = access_token
//                    JZGHManager.shared.isShowLoginView = !JZGHManager.shared.isShowLoginView
//                }
//                // 获取用户信息
//            }
//        }
//    }
//    
//}

