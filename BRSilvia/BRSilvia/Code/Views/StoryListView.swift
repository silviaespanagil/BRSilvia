//
//  StoryListView.swift
//  BRSilvia
//
//  Created by Silvia España Gil on 7/6/25.
//

import SwiftUI

struct StoryListView: View {
    @StateObject private var viewModel = StoryListViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                ForEach(viewModel.stories) { story in
                    StoryCircleView(story: story)
                        .onTapGesture {
                            viewModel.selectedStory = story
                        }
                        .onAppear {
                            viewModel.loadMoreStoriesIfNeeded(for: story)
                        }
                }
                
                if viewModel.isLoading {
                    ProgressView()
                        .frame(width: 60, height: 60)
                }
            }
            .padding(.horizontal)
        }
        .fullScreenCover(item: $viewModel.selectedStory) { story in
        StoryContentView(
                stories: viewModel.stories,
                startingStory: story,
                onDismiss: { viewModel.selectedStory = nil }
            )
        }
    }
}

#Preview {
    StoryListView()
}
