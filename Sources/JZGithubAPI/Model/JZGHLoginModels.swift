//
//  JZGHLoginModels.swift
//  JZGithubDemo
//
//  Created by S JZ on 2023/11/16.
//

import Foundation

struct JZGHBaseModel: Decodable {}

// 获取Token接口的的Model
struct JZGHAccessToken: Decodable {
    var access_token: String?
    var expires_in: Int?
    var refresh_token: String?
    var refresh_token_expires_in: Int64?
    var token_type: String?
    var scope: String?
}

// 获取用户信息接口的Model
struct JZGHUserInfo: Decodable {
    var login: String?
    var id: Int?
    var node_id: String?
    var avatar_url: String?
    var gravatar_id: String?
    var url: String?
    var html_url: String?
    var followers_url: String?
    var following_url: String?
    var gists_url: String?
    var starred_url: String?
    var subscriptions_url: String?
    var organizations_url: String?
    var repos_url: String?
    var events_url: String?
    var received_events_url: String?
    var type: String?
    var site_admin: Bool?
    var name: String?
    var company: String?
    var blog: String?
    var location: String?
    var email: String?
    var hireable: String?
    var bio: String?
    var twitter_username: String?
    var public_repos: Int?
    var public_gists: Int?
    var followers: Int?
    var following: Int?
    var created_at: String?
    var updated_at: String?
}
