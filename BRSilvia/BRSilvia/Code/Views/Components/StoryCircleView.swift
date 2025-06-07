//
//  StoryCircleView.swift
//  BRSilvia
//
//  Created by Silvia España Gil on 7/6/25.
//

import SwiftUI

struct StoryCircleView: View {
    @EnvironmentObject var persistenceService: PersistenceService
    
    let story: Story
    
    var body: some View {
        VStack(spacing: 4) {
            AvatarImageView(url: URL(string: story.user.profilePictureUrl), size: 60)
            .overlay(
                Circle()
                    .stroke(
                        persistenceService.isUserSeen(story.user.id) ?
                        LinearGradient.beRealSeen : LinearGradient.beRealUnseen,
                        lineWidth: 2.5
                    )
            )
            
            Text(story.user.name)
                .font(.caption)
                .foregroundColor(.beRealDark)
                .lineLimit(1)
                .frame(width: 60)
        }
    }
}
