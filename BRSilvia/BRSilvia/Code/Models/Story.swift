//
//  Story.swift
//  BRSilvia
//
//  Created by Silvia España Gil on 7/6/25.
//

import Foundation

struct Story: Identifiable, Codable, Equatable {
    let id: String
    let user: User
    let imageUrl: String
    let timestamp: Date
    
    init(id: String, user: User, imageUrl: String) {
        self.id = id
        self.user = user
        self.imageUrl = imageUrl
        self.timestamp = Date()
    }
}
