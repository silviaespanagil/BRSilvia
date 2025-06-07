//
//  StoryContentView.swift
//  BRSilvia
//
//  Created by Silvia España Gil on 7/6/25.
//

import SwiftUI

struct StoryContentView: View {
    @EnvironmentObject var persistenceService: PersistenceService
    
    let stories: [Story]
    let startingStory: Story
    let onDismiss: () -> Void
    
    @State private var currentIndex = 0
    
    var currentStory: Story {
        guard currentIndex < stories.count else { return stories.first ?? startingStory }
        return stories[currentIndex]
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.ignoresSafeArea()
                storyImage(geometry: geometry)
                navigationControls
                contentOverlay
                closeButton
            }
        }
        .onAppear {
            if let index = stories.firstIndex(where: { $0.id == startingStory.id }) {
                currentIndex = index
            }
            persistenceService.markAsSeen(userId: currentStory.user.id)
        }
        .onChange(of: currentIndex) { _ in
            persistenceService.markAsSeen(userId: currentStory.user.id)
        }
    }
    
    @ViewBuilder
    func storyImage(geometry: GeometryProxy) -> some View {
        AsyncImage(url: URL(string: currentStory.imageUrl.isEmpty ? "https://picsum.photos/400/800?random=\(currentStory.id)" : currentStory.imageUrl)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geometry.size.width)
                .clipped()
        } placeholder: {
            Rectangle()
                .fill(Color.beRealLightGray)
                .frame(width: geometry.size.width)
                .overlay(
                    ProgressView()
                        .scaleEffect(1.5)
                )
        }
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    var navigationControls: some View {
        HStack(spacing: 0) {
            Rectangle()
                .fill(Color.clear)
                .contentShape(Rectangle())
                .onTapGesture { previousStory() }
            
            Rectangle()
                .fill(Color.clear)
                .contentShape(Rectangle())
                .onTapGesture { nextStory() }
        }
        .gesture(
            DragGesture()
                .onEnded { value in
                    if value.translation.height > 100 {
                        onDismiss()
                    }
                }
        )
    }
    
    @ViewBuilder
    var contentOverlay: some View {
        VStack {
            userInfo
            Spacer()
            likeButton
        }
    }
    
    @ViewBuilder
    var userInfo: some View {
        HStack(spacing: 12) {
            AvatarImageView(url: URL(string: currentStory.user.profilePictureUrl), size: 40)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(currentStory.user.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Text("2m ago")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.8))
            }
            
            Spacer()
        }
        .padding()
    }
    
    @ViewBuilder
    var likeButton: some View {
        HStack {
            Spacer()
            
            CircularIconButtonView(
                systemName: persistenceService.isUserLiked(currentStory.user.id) ? "heart.fill" : "heart",
                foregroundColor: persistenceService.isUserLiked(currentStory.user.id) ? .red : .white
            ) {
                persistenceService.toggleLike(userId: currentStory.user.id)
            }

        }
        .padding()
    }
    
    @ViewBuilder
    var closeButton: some View {
        VStack {
            HStack {
                Spacer()
                CircularIconButtonView(systemName: "xmark", action: onDismiss)
            }.padding()
            Spacer()
        }
    }
    
    private func previousStory() {
        if currentIndex > 0 {
            currentIndex -= 1
        } else {
            onDismiss()
        }
    }
    
    private func nextStory() {
        if currentIndex < stories.count - 1 {
            currentIndex += 1
        } else {
            onDismiss()
        }
    }
}
#Preview {
    ContentView()
} 
