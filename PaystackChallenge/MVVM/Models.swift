//
//  Models.swift
//  PaystackChallenge
//
//  Created by Masud Onikeku on 03/07/2024.
//

import Foundation

public class Owner : Codable {
    
    public var login: String
    public var id: Int
    public var avatar: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case id
        case avatar = "avatar_url"
    }
    
    public init(login: String, id: Int, avatar: String) {
        self.login = login
        self.id = id
        self.avatar = avatar
    }
    
}

public class APIRepo : Codable, Identifiable {

    public let id: Int
    public let name: String
    public let descriptions: String?
    public let url: String
    public let owner: Owner
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case descriptions
        case url
        case owner
    }
    
    public init(id: Int, name: String, description: String?, url: String, owner: Owner) {
        self.id = id
        self.name = name
        self.descriptions = description
        self.url = url
        self.owner = owner
    }
    
}

struct APIResult : Codable {
    
    public let total_count: Int
    public let incomplete_results: Bool
    public let items: [APIRepo]
    
    enum CodingKeys: String, CodingKey {
        case total_count
        case incomplete_results
        case items
        
    }
    
}
