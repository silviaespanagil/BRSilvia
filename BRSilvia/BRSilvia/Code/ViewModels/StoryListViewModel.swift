//
//  StoryListViewModel.swift
//  BRSilvia
//
//  Created by Silvia España Gil on 7/6/25.
//

import Foundation
import SwiftUI

class StoryListViewModel: ObservableObject {
    var persistenceService: PersistenceService?
    
    @Published var stories: [Story] = []
    @Published var isLoading = false
    @Published var selectedStory: Story?
    
    private let dataService = DataService()
    private var currentPage = 0
    private let pageSize = 10
    
    init() {
        loadInitialStories()
    }
    
    func loadInitialStories() {
        stories = dataService.loadStories(page: 0, pageSize: pageSize)
        currentPage = 1
    }
    
    func loadMoreStoriesIfNeeded(for story: Story) {
        guard story.id == stories.last?.id, !isLoading else { return }
        loadMoreStories()
    }
    
    private func loadMoreStories() {
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            let newStories = self.dataService.loadStories(page: self.currentPage, pageSize: self.pageSize)
            self.stories.append(contentsOf: newStories)
            self.currentPage += 1
            self.isLoading = false
        }
    }
}
