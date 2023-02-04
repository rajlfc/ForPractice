//
//  Entity.swift
//  Viper
//
//  Created by Sudipta Kumar Bhattacharjee on 01/02/23.
//

import Foundation

struct LoginResponse: Codable {
    var login: String
    var id: Int
    var node_id: String
    var ur: String
    var repos_url: String
    var events_url: String
    var hooks_url: String
    var issues_url: String
    var members_url: String
    var public_members_url: String
    var avatar_url: String
    var description: String
}

struct apiEndpoint {
    var endPoint = "https://api.github.com/users/hadley/orgs"
}
