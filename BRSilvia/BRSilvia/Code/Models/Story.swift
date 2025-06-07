//
//  Story.swift
//  BRSilvia
//
//  Created by Silvia España Gil on 7/6/25.
//

import Foundation

struct Story: Identifiable, Codable, Equatable {
    let id: String
    let userId: Int
    let imageUrl: String
    let timestamp: Date
    
    init(userId: Int, storyIndex: Int) {
        self.id = "\(userId)-\(storyIndex)"
        self.userId = userId
        self.imageUrl = "https://picsum.photos/seed/user\(userId)story\(storyIndex)/400/600"
        self.timestamp = Date()
    }
}
