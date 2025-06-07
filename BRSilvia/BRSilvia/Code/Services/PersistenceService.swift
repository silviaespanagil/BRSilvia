//
//  PersistenceService.swift
//  BRSilvia
//
//  Created by Silvia España Gil on 7/6/25.
//

import Foundation

class PersistenceService: ObservableObject {
    private let userDefaults = UserDefaults.standard
    private let storyStatesKey = "story_states"
    
    func getStoryState(for userId: Int) -> StoryState? {
        guard let data = userDefaults.data(forKey: "\(storyStatesKey)_\(userId)"),
              let state = try? JSONDecoder().decode(StoryState.self, from: data) else {
            return nil
        }
        return state
    }
    
    func saveStoryState(_ state: StoryState) {
        guard let data = try? JSONEncoder().encode(state) else { return }
        userDefaults.set(data, forKey: "\(storyStatesKey)_\(state.userId)")
    }
    
    func markAsSeen(userId: Int) {
        var state = getStoryState(for: userId) ?? StoryState(userId: userId)
        state.isSeen = true
        state.lastViewedAt = Date()
        saveStoryState(state)
    }
    
    func toggleLike(userId: Int) {
        var state = getStoryState(for: userId) ?? StoryState(userId: userId)
        state.isLiked.toggle()
        saveStoryState(state)
    }
    
    func isUserSeen(_ userId: Int) -> Bool {
        return getStoryState(for: userId)?.isSeen ?? false
    }
    
    func isUserLiked(_ userId: Int) -> Bool {
        return getStoryState(for: userId)?.isLiked ?? false
    }
}
