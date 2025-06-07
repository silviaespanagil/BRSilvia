//
//  StoryState.swift
//  BRSilvia
//
//  Created by Silvia España Gil on 7/6/25.
//

import Foundation

struct StoryState: Codable {
    let userId: Int
    var isSeen: Bool = false
    var isLiked: Bool = false
    var lastViewedAt: Date?
    
    init(userId: Int) {
        self.userId = userId
    }
}
