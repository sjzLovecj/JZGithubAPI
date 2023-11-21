//
//  JZGHAuthView.swift
//  JZGithubDemo
//
//  Created by S JZ on 2023/11/16.
//

import SwiftUI
import WebKit

#if os(macOS)
public typealias JZViewRepresentable = NSViewRepresentable
#else
public typealias JZViewRepresentable = UIViewRepresentable
#endif

struct JZGHAuthView: JZViewRepresentable {
    @Binding var isPresented: Bool
    @EnvironmentObject var loginModel: JZGHLoginModel
    
#if os(macOS)
    func makeNSView(context: Context) -> some WKWebView {
        let confifuration = WKWebViewConfiguration()
        confifuration.userContentController = WKUserContentController()
        confifuration.preferences = WKPreferences()
        confifuration.preferences.minimumFontSize = 10
        confifuration.preferences.javaScriptCanOpenWindowsAutomatically = true

        confifuration.processPool = WKProcessPool()
        confifuration.allowsAirPlayForMediaPlayback = true
        
        let webView = WKWebView(frame: .zero, configuration: confifuration)
        webView.navigationDelegate = context.coordinator
        webView.allowsBackForwardNavigationGestures = true
        return webView
    }
    
    func updateNSView(_ nsView: NSViewType, context: Context) {
        if !loginModel.urlString.isEmpty {
            if let authURL = URL(string: loginModel.urlString) {
                let authRequest = URLRequest(url: authURL)
                nsView.load(authRequest)
            }
        }
    }
#else
    func makeUIView(context: Context) -> some WKWebView {
        let confifuration = WKWebViewConfiguration()
        confifuration.userContentController = WKUserContentController()
        confifuration.preferences = WKPreferences()
        confifuration.preferences.minimumFontSize = 10
        confifuration.preferences.javaScriptCanOpenWindowsAutomatically = true

        confifuration.processPool = WKProcessPool()
        confifuration.allowsAirPlayForMediaPlayback = true
        
        let webView = WKWebView(frame: .zero, configuration: confifuration)
        webView.navigationDelegate = context.coordinator
        webView.allowsBackForwardNavigationGestures = true
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if !url.isEmpty {
            if let authURL = URL(string: url) {
                let authRequest = URLRequest(url: authURL)
                uiView.load(authRequest)
            }
        }
    }
#endif
    func makeCoordinator() -> Coordinator {
        return Coordinator(isPresented: $isPresented)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        @Binding var isPresented: Bool
        
        init(isPresented: Binding<Bool>) {
            self._isPresented = isPresented
        }
        
        // 拦截回调的URL
        public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            // 拦截回调地址
            if let currentURL = navigationAction.request.url, currentURL.absoluteString.contains(JZGHManager.GITHUB_CALLBACKURL) {
                // 返回的回调"http://localhost:8080/?code=805036151054ebbd77b2"
                debugPrint(currentURL.absoluteString)
                // 解析回调地址，获取Code
                getCode(fromCallBack: currentURL)
                decisionHandler(.cancel)
            }
    
            decisionHandler(.allow)
        }
    
        private func getCode(fromCallBack url: URL) {
            if let query = url.query() {
                let codeValue = query.replacingOccurrences(of: "code=", with: "")
                // 请求获取access_token
                JZGHRequest.getAccessToken(codeValue) { [self] tokenModel in
                    // 存储Token
                    if let access_token = tokenModel.access_token {
                        JZGHManager.shared.ACCESS_TOKEN = access_token
                        isPresented = false
                    }
                }
            }
        }
    }
    
}


