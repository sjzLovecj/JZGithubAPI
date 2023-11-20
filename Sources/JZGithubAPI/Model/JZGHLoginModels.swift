//
//  JZGHLoginModels.swift
//  JZGithubDemo
//
//  Created by S JZ on 2023/11/16.
//

import Foundation

public struct JZGHBaseModel: Decodable {}

// 获取Token接口的的Model
public struct JZGHAccessToken: Decodable {
    public var access_token: String?
    public var expires_in: Int?
    public var refresh_token: String?
    public var refresh_token_expires_in: Int64?
    public var token_type: String?
    public var scope: String?
}

// 获取用户信息接口的Model
public struct JZGHUserInfo: Decodable {
    public var login: String?
    public var id: Int?
    public var node_id: String?
    public var avatar_url: String?
    public var gravatar_id: String?
    public var url: String?
    public var html_url: String?
    public var followers_url: String?
    public var following_url: String?
    public var gists_url: String?
    public var starred_url: String?
    public var subscriptions_url: String?
    public var organizations_url: String?
    public var repos_url: String?
    public var events_url: String?
    public var received_events_url: String?
    public var type: String?
    public var site_admin: Bool?
    public var name: String?
    public var company: String?
    public var blog: String?
    public var location: String?
    public var email: String?
    public var hireable: String?
    public var bio: String?
    public var twitter_username: String?
    public var public_repos: Int?
    public var public_gists: Int?
    public var followers: Int?
    public var following: Int?
    public var created_at: String?
    public var updated_at: String?
}
