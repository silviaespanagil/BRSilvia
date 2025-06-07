//
//  User.swift
//  BRSilvia
//
//  Created by Silvia España Gil on 7/6/25.
//

import Foundation

struct User: Identifiable, Codable, Equatable {
    let id: Int
    let name: String
    let profilePictureUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case profilePictureUrl = "profile_picture_url"
    }
}

struct UserPage: Codable {
    let users: [User]
}

struct UserResponse: Codable {
    let pages: [UserPage]
}
